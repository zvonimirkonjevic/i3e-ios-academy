//
//  TweetrPost.swift
//  ios-academy
//
//  Created by student on 10.12.2022..
//

import SwiftUI

struct TweetModel : Identifiable{
    var id = UUID().uuidString
    
    // kreiramo novu strukturu kako bi mogli imati vise razlicitih contenta, username-a, itd.
    let content: String
    let username: String
    let date: Date
    let image: String
}

struct TweetPost: View {
    
    
    @Binding var tweet: TweetModel // kako bi mogli omoguciti like i unlike tweeta
    
    @EnvironmentObject var userData: UserData
    
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
            
            Button(action: {
                
               if userData.favouriteTweets.contains(tweet.id){
                   userData.favouriteTweets.remove(tweet.id)
                }
                else{
                    userData.favouriteTweets.insert(tweet.id)
                }
               // tweet.isFavourite.toggle() // omogucuje promjenu stanja gumba like u true ili false (item koji mjenjamo ne smije biti let vec var)
            }) {
                if userData.favouriteTweets.contains(tweet.id){
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
        TweetPost(tweet: Binding.constant (TweetModel(
            content: "tweet 1",
            username: "username",
            date: Date(),
            image: "crow")))
        .environmentObject(UserData())
    }
}
