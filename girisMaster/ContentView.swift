//
//  ContentView.swift
//  girisMaster
//
//  Created by MURAT HASIRCI on 23.01.2024.
//

import SwiftUI
import Firebase

struct ContentView: View {
    
    @State private var girisYapildi = false
    
    var body: some View {
        
        if girisYapildi{
            VStack {
                Text("Ana Sayfa")
                
                
                
                
                
                
                
                
                Spacer()
                Button {
                    let firebaseAuth = Auth.auth()
                    do {
                      try firebaseAuth.signOut()
                        girisYapildi = false
                    } catch let signOutError as NSError {
                      print("Error signing out: %@", signOutError)
                    }
                } label: {
                    
                    Text("ÇIKIŞ")
                    
                    
                }

            }
        }else{
            content
        }
        
       
        
        
        
        
    }
    
    
    
    
    
    var content: some View{
        GirisYap(girisYapildi: $girisYapildi)
    }
    
    
    
    
}

#Preview {
    ContentView()
}
