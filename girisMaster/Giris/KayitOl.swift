//
//  KayitOl.swift
//  girisMaster
//
//  Created by MURAT HASIRCI on 23.01.2024.
//

import SwiftUI
import FirebaseAuth

struct KayitOl: View {
    @State private var mail = ""
    @State private var pass = ""
    @State private var name = ""
    @State private var aciklama = ""
//    @State var sosyal : [String] = ["face", "instagram", "google", "faceId"]
    @Binding var girisYapildi : Bool
    @Environment(\.dismiss) var dismiss

    var body: some View {
        
        VStack{
            ScrollView{
            Image("logo")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .padding(.vertical, 6)
            
                TextField("Adınız", text: $name)
                    .padding(10)
                    .background(Color.white).cornerRadius(15)
                    .shadow(color: .black.opacity(0.4), radius: 10)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 16)
                TextField("E-posta adresiniz", text: $mail)
                    .padding(10)
                    .background(Color.white).cornerRadius(15)
                    .shadow(color: .black.opacity(0.4), radius: 10)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 16)
                TextField("Şifre", text: $pass)
                    .padding(10)
                    .background(Color.white).cornerRadius(15)
                    .shadow(color: .black.opacity(0.4), radius: 10)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 16)
                
                TextField("Açıklama", text: $aciklama)
                    .padding(10)
                    .background(Color.white).cornerRadius(15)
                    .shadow(color: .black.opacity(0.4), radius: 10)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 16)
                
                Button {
                    
                    
                    
                    Auth.auth().createUser(withEmail: mail, password: pass){ result, error in
                        if error != nil{
                            print(error!.localizedDescription)
                        }else{
                            girisYapildi = true
                        }
                    }
                    
                    
                    
                } label: {
                    Text("Kayıt Ol")
                        .padding()
                        .frame(width: UIScreen.main.bounds.width - 32)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(16)
                    
                }
                
                
                Divider()
                    .padding(16)
//                    .padding(.top, 16)
                Sosyal(girisYapildi: $girisYapildi)
            }
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3){
                    Text("Placeholder")
                    Text("Giriş Yap")
                        .fontWeight(.bold)
                }
            }
        }
        .onAppear(){
            Auth.auth().addStateDidChangeListener { auth, user in
                if user != nil {
                    girisYapildi.toggle()
                }
            }
        }
    }
}

#Preview {
    KayitOl(girisYapildi: .constant(false))
}
