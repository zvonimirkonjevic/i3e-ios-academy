//
//  ContentView.swift
//  ios-academy
//
//  Created by student on 10.12.2022..
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var tweetData: TweetData
    
    @EnvironmentObject var userData: UserData
    
    @State var content: String = ""
    
    
    @State var isLoginViewPresented = false
    
    var body: some View {
        VStack {
            /*Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
                .bold()
                .font(.title)
            
            Spacer()
            
            Button(action: {}) {
            Text("Tap me!")
            }*/
            
            HStack{ // header s title i buttonom za login
                Text(userData.username.isEmpty ? "Guest" : userData.username) // header
                    .font(.title)
                
                Spacer() // pravi prostor izmedu dva elementa, slicno kao space-between
                
                Button(action: { // login button
                    isLoginViewPresented = true
                    
                }) {
                    Text("Login")
                }
            }
            
            Spacer() // pusha text na vrh
            
            List($tweetData.tweets){ tweet in// pravimo listu u app-u (u ovom sluc s tweetovima)
                // predajemo kao argument listi polje tweets
                TweetPost(tweet: tweet) // slicno for each petlji koja prolazi kroz polje tweets te pravi dva TweetPost objekta u listi
            }
            .listStyle(.plain) // promjena stila liste
            
            HStack{
                
                TextField("Content", text: $content)
                
                Button(action: { // button koji na click appenda novi tweet s mogucnosti unosa contenta tweeta
                    tweetData.tweets.append(TweetModel(content: content, username: "zvonimirkonjevic", date: Date(), imageURL: IMAGE_URL))
                    content = "" // resetira content na prazno nakon sto smo objavili tweet
                }){
                    Text("New tweet")
                }
                .disabled(content.isEmpty) // omogucuje postanje tweeta samo ako content nije prazan
                
            }
        }
        .padding()
        .sheet(isPresented: $isLoginViewPresented) {
            LoginView(username: $userData.username, isPresented: $isLoginViewPresented)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TweetData())
            .environmentObject(UserData())
        
    }
}
