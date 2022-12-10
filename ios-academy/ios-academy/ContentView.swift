//
//  ContentView.swift
//  ios-academy
//
//  Created by student on 10.12.2022..
//

import SwiftUI

struct ContentView: View {
    
    @State var content: String = ""
    
    @State var username: String = ""
    
    @State var isLoginViewPresented = false
    
    @State var tweets: [TweetModel] = [ // ubacujemo strukturu TweetyModel kao jedan element polja
        TweetModel(
            content: "tweet 1",
            username: "username",
            date: Date(),
            image: "crow",
            isFavourite: false),
        TweetModel(
            content: "tweet 2",
            username: "username",
            date: Date(),
            image: "crow",
            isFavourite: true),
    ]
    
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
                Text(username.isEmpty ? "Guest" : username) // header
                    .font(.title)
                
                Spacer() // pravi prostor izmedu dva elementa, slicno kao space-between
                
                Button(action: { // login button
                    isLoginViewPresented = true
                    
                }) {
                    Text("Login")
                }
            }
            
            Spacer() // pusha text na vrh
            
            List($tweets){ tweet in// pravimo listu u app-u (u ovom sluc s tweetovima)
                // predajemo kao argument listi polje tweets
                TweetPost(tweet: tweet) // slicno for each petlji koja prolazi kroz polje tweets te pravi dva TweetPost objekta u listi
            }
            .listStyle(.plain) // promjena stila liste
            
            HStack{
                
                TextField("Content", text: $content)
                
                Button(action: { // button koji na click appenda novi tweet s mogucnosti unosa contenta tweeta
                    tweets.append(TweetModel(content: content, username: "zvonimirkonjevic", date: Date(), image: "crow", isFavourite: true))
                    content = "" // resetira content na prazno nakon sto smo objavili tweet
                }){
                    Text("New tweet")
                }
                .disabled(content.isEmpty) // omogucuje postanje tweeta samo ako content nije prazan
                
            }
        }
        .padding()
        .sheet(isPresented: $isLoginViewPresented) {
            LoginView(username: $username, isPresented: $isLoginViewPresented)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
