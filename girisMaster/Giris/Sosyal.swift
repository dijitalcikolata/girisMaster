//
//  Sosyal.swift
//  girisMaster
//
//  Created by MURAT HASIRCI on 2.02.2024.
//

import SwiftUI

struct Sosyal: View {
    var body: some View {
        VStack {
            
            
            Button {
                //
            } label: {
                HStack {
                    Image("facebook_logo") // Facebook logosu ekleyebilirsiniz
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                    
                    Text("Facebook ile Giriş Yap")
                        .font(.headline)
                        .foregroundColor(.white)
                }
            }
            .padding(10)
            .frame(width: UIScreen.main.bounds.width - 32)
            .background(Color.blue) // Facebook'un mavi rengini kullanabilirsiniz
            .cornerRadius(8)
            
            Button {
                //
            } label: {
                HStack {
                    Image("instagram") // Facebook logosu ekleyebilirsiniz
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                    
                    Text("Instagram ile Giriş Yap")
                        .font(.headline)
                        .foregroundColor(.black)
                }
            }
            .padding(10)
            .frame(width: UIScreen.main.bounds.width - 32)
            .background(Color.white) // Facebook'un mavi rengini kullanabilirsiniz
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.red, lineWidth: 2)
            )
            
            Button {
                //
            } label: {
                HStack {
                    Image("google") // Facebook logosu ekleyebilirsiniz
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                    
                    Text("Google ile Giriş Yap")
                        .font(.headline)
                        .foregroundColor(.black)
                }
            }
            .padding(10)
            
            .frame(width: UIScreen.main.bounds.width - 32)
            .background(Color.white) // Facebook'un mavi rengini kullanabilirsiniz
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.blue, lineWidth: 2)
            )
            
            Button {
                //
            } label: {
                HStack {
                    Image(systemName: "apple.logo") // Facebook logosu ekleyebilirsiniz
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                    
                    Text("Apple ile Giriş Yap")
                        .font(.headline)
                        .foregroundColor(.white)
                }
            }
            .padding(10)
            .frame(width: UIScreen.main.bounds.width - 32)
            .background(Color.black) // Facebook'un mavi rengini kullanabilirsiniz
            .cornerRadius(8)
            
//            Button {
//                //
//            } label: {
//                HStack {
//                    Image("faceId") // Facebook logosu ekleyebilirsiniz
//                        .resizable()
//                        .frame(width: 30, height: 30)
//                        .foregroundColor(.white)
//
//                    Text("Face-Id ile Giriş Yap")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                }
//            }
//            .padding(10)
//            .frame(width: UIScreen.main.bounds.width - 32)
//            .background(Color.black) // Facebook'un mavi rengini kullanabilirsiniz
//            .cornerRadius(8)
            
        }
    }
}

#Preview {
    Sosyal()
}
