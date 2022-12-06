//
//  TweetyPost.swift
//  twitter-clone-ios-academy
//
//  Created by student on 06.12.2022..
//

import SwiftUI

struct TweetModel : Identifiable{
    var id = UUID()
    
    // kreiramo novu strukturu kako bi mogli imati vise razlicitih contenta, username-a, itd.
    let content: String
    let username: String
    let date: Date
    let image: String
    let isFavourite: Bool
    
    
}

struct TweetPost: View {
    
    let tweet: TweetModel
    
    var body: some View {
        HStack{
            Image("crow") // stavljamo sliku u app(stavljamo samo ime slike)
                .resizable() // resizeamo sliku
                .frame(width: 55, height: 55) // fiksiramo width i height na odredenu velicinu
                .clipShape(Circle()) // mjenjamo oblik slike
            VStack {
                Text(tweet.username)
                Text(tweet.content)
                Text(tweet.date, style: .relative) // dodajemo datum kao tekst slicno kao datetime u C#, relative je format datuma
                
            }
            
            Spacer()
            
            Button(action: {}) {
                if(tweet.isFavourite){
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                }
                else{
                    Image(systemName: "heart")
                        .foregroundColor(.red)
                }
            }
        }
    }
}

struct TweetPost_Previews: PreviewProvider {
    static var previews: some View {
        TweetPost(tweet: TweetModel(
            content: "tweet 1",
            username: "username",
            date: Date(),
            image: "crow",
            isFavourite: true ))
    }
}
