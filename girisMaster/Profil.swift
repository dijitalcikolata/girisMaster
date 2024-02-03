//
//  Profil.swift
//  girisMaster
//
//  Created by MURAT HASIRCI on 23.01.2024.
//

import SwiftUI

struct Profil: View {
    var body: some View {
        List{
            Section{
                HStack{
                    Text("MH")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 70, height: 70)
                        .background(Color(.systemGray3))
                        .clipShape(Circle())
                    VStack{
                        Text("Murat HASIRCI")
                            .fontWeight(.semibold)
                            .padding(.top, 4)
                        Text("murathasirci@hotmail.com")
                            .font(.footnote)
                            .accentColor(.gray)
                            
                    }//Vstack
                }//Hstack
            }//Section
            Section("Deneme"){
                
            }
            Section("Deneme2"){
                
            }
        }//List
    }//body
}

#Preview {
    Profil()
}
