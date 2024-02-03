//
//  GirisYap.swift
//  girisMaster
//
//  Created by MURAT HASIRCI on 23.01.2024.
//

import SwiftUI
import FirebaseAuth

struct GirisYap: View {
    @State private var mail = ""
    @State private var pass = ""

    @Binding var girisYapildi : Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack{
                    Image("logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .padding(.vertical, 16)
                    
                    Text("Giriş Yap").padding()
                    TextField("mail", text: $mail)
                        .padding()
                        .background(Color.white).cornerRadius(15)
                        .shadow(color: .black.opacity(0.4), radius: 10)
                        .padding(.horizontal, 16)
                        .padding(.bottom, 16)
                    TextField("pass", text: $pass)
                        .padding()
                        .background(Color.white).cornerRadius(15)
                        .shadow(color: .black.opacity(0.4), radius: 10)
                        .padding(.horizontal, 16)
                        .padding(.bottom, 16)
                    Button {
 
                        Auth.auth().signIn(withEmail: mail, password: pass){ user, error in
                            if error != nil{
                                print(error!.localizedDescription)
                            }else{
                                girisYapildi = true
                            }
                        }
                        
                        
                    } label: {
                        Text("Giriş")
                            .padding()
                            .frame(width: UIScreen.main.bounds.width - 32)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(16)
                                
                    }
                    
                    
                }
                
                Divider().padding()
                Spacer()
//                Sosyal()
                
                
                
                Spacer()
                
                
                
                
                
                NavigationLink{
                    KayitOl(girisYapildi: $girisYapildi).navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 3){
                        Text("Placeholder")
                        Text("Kayıt Ol")
                            .fontWeight(.bold)
                    }
                }.font(.system(size: 14))
                
                
            

            }
//            .padding()
            .onAppear(){
                Auth.auth().addStateDidChangeListener { auth, user in
                    if user != nil {
                        girisYapildi.toggle()
                    }
                }
            }
        }
    }
}

#Preview {
    GirisYap(girisYapildi: .constant(false))
}
