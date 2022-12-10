//
//  LoginView.swift
//  ios-academy
//
//  Created by student on 10.12.2022..
//

import SwiftUI

struct LoginView: View {
    
    @Binding var username: String
    
    @Binding var isPresented: Bool
    
    var body: some View {
        
            VStack{
                Spacer()
                
                HStack{
                    Image("crow")
                        .resizable()
                        .frame(width: 75, height: 75)
                        .clipShape(Circle())
                    
                    Text("Tweetr")
                        .bold()
                        .font(.title)
                        .padding(.leading, 20)
                }
                
                TextField("Username", text: $username)
                    .padding(.horizontal, 80.0)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(.roundedBorder)
                Button(action: {isPresented = false}) {
                    Text("Login")
                }
                
                Spacer()
            }
        }
    }

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(username: Binding.constant(""),
                  isPresented: Binding.constant(true))
    }
}
