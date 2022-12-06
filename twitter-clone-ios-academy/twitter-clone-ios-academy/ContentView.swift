//
//  ContentView.swift
//  twitter-clone-ios-academy
//
//  Created by student on 06.12.2022..
//

import SwiftUI

struct ContentView: View {
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
                Text("Tweety") // header
                    .bold()
                    .font(.title)
                
                Spacer() // pravi prostor izmedu dva elementa
                
                Button(action: {}) { // login button
                    Text("login")
                }
            }
            
            Spacer() // pusha text na vrh
            
            List{ // pravimo listu u app-u (u ovom sluc s tweetovima)
                TweetyPost() // extractali HStack u poseban view radi preglednosti i poput funkcije u C-u
                TweetyPost()
                TweetyPost()
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

struct TweetyPost: View {
    var body: some View {
        HStack{
            Image("crow") // stavljamo sliku u app(stavljamo samo ime slike)
                .resizable() // resizeamo sliku
                .frame(width: 55, height: 55) // fiksiramo width i height na odredenu velicinu
                .clipShape(Circle()) // mjenjamo oblik slike
            VStack {
                Text("username")
                Text("Tweet 1")
                Text(Date(), style: .relative) // dodajemo datum kao tekst slicno kao datetime u C#, relative je format datuma
                
            }
        }
    }
}
