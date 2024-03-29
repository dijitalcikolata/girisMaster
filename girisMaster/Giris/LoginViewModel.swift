import SwiftUI
import Firebase
import FirebaseAuth
import CryptoKit
import AuthenticationServices
//import GoogleSignIn
import Foundation

class LoginViewModel: ObservableObject{
    
    // MARK: Success Properties
    @Published var showSuccess: Bool = false
    @Published var successMessage: String = ""
    
    // MARK: Error Properties
    @Published var showError: Bool = false
    @Published var errorMessage: String = ""
    
    
    // MARK: App Log Status
    @AppStorage("log_status") var logStatus: Bool = false
    
    @AppStorage("token") var token: String?
    
    @AppStorage("login_name") var loginName: String = ""
    
    // MARK: Apple Sign in Properties
    @Published var nonce: String = ""
    
    
    
    // MARK: Handling Error
    func handleError(error: Error) async{
        await MainActor.run(body: {
            errorMessage = error.localizedDescription
            showError.toggle()
        })
    }
    
    // MARK: Apple Sign in API
    func appleAuthenticate(credential: ASAuthorizationAppleIDCredential){
        // getting token...
        guard let token = credential.identityToken else{
            print("error with firebase")
            return
        }
        
        // Token String
        guard let tokenString = String(data: token, encoding: .utf8) else{
            print("error with Token")
            return
        }
        
        let firebaseCredential = OAuthProvider.credential(withProviderID: "apple.com", idToken: tokenString, rawNonce: nonce)
        
        Auth.auth().signIn(with: firebaseCredential){(result, err) in
            if let error = err{
                print(error.localizedDescription)
                return
            }
            
            let name = "Unknown"
            if let display_name = result?.user.displayName{
                self.loginName = display_name
            }
            else{
                self.loginName = name
            }
        
            guard let email = result?.user.email else{
                print("email not found with apple auth")
                return
            }
            
            guard let uid = result?.user.uid else{
                print("uid not found with apple auth")
                return
                
            }
            
            if (result?.user.phoneNumber) != nil{
            }
            print("here")
            print(email)
            print(uid)
            
            self.logStatus = true
            
            
            
        }
    }
    
   
    
}

// MARK: Extensions
extension UIApplication{
    func closeKeyboard(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    // Root Controller
    func rootController()->UIViewController{
        guard let window = connectedScenes.first as? UIWindowScene else{return .init()}
        guard let viewcontroller = window.windows.last?.rootViewController else {return .init()}
        return viewcontroller
    }
}

// MARK: Apple Sign in Helpers
private func sha256(_ input: String) -> String {
  let inputData = Data(input.utf8)
  let hashedData = SHA256.hash(data: inputData)
  let hashString = hashedData.compactMap {
    String(format: "%02x", $0)
  }.joined()

  return hashString
}

func randomNonceString(length: Int = 32) -> String {
  precondition(length > 0)
  var randomBytes = [UInt8](repeating: 0, count: length)
  let errorCode = SecRandomCopyBytes(kSecRandomDefault, randomBytes.count, &randomBytes)
  if errorCode != errSecSuccess {
    fatalError(
      "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
    )
  }

  let charset: [Character] =
    Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")

  let nonce = randomBytes.map { byte in
    // Pick a random character from the set, wrapping around if needed.
    charset[Int(byte) % charset.count]
  }

  return String(nonce)
}

    
