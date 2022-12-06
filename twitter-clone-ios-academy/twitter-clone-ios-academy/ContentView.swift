//
//  ContentView.swift
//  twitter-clone-ios-academy
//
//  Created by student on 06.12.2022..
//

import SwiftUI



struct ContentView: View {
    
    let tweets: [TweetModel] = [ // ubacujemo strukturu TweetyModel kao jedan element polja
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
                Text("Tweeter") // header
                    .bold()
                    .font(.title)
                
                Spacer() // pravi prostor izmedu dva elementa, slicno kao space-between
                
                Button(action: {}) { // login button
                    Text("login")
                }
            }
            
            Spacer() // pusha text na vrh
            
            List(tweets){ tweet in// pravimo listu u app-u (u ovom sluc s tweetovima)
                // predajemo kao argument listi polje tweets
                TweetPost(tweet: tweet) // slicno for each petlji koja prolazi kroz polje tweets te pravi dva TweetPost objekta u listi 	
            }
            .listStyle(.plain) // promjena stila liste
                
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
