//
//  ProfileView.swift
//  ios-academy
//
//  Created by student on 12.12.2022..
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var tweetData: TweetData
    
    @EnvironmentObject var userData: UserData
    
    var tweets: [TweetModel] { // u listu ubacuje tweetove koji je kreirala odredena osoba
        return tweetData.tweets.filter{ tweet in
            return tweet.username == userData.username
        }
    }
    
    var body: some View {
        VStack{
            HStack{
                Image("crow")
                    .resizable()
                    .frame(width: 75, height: 75)
                    .clipShape(Circle())
                Text(userData.username.isEmpty ? "Guest" : userData.username)
                    .font(.title)
                
            }
            .padding(.vertical, 20.0)
            
            Spacer()
            
            VStack{
                Text("Recent tweets: ")
                    .padding(.trailing, 250.0)
                
                List(tweets) { tweetsModel in // prikazuje listu tweetova s filtriranih po usernameu
                    TweetPost( tweet:
                            Binding.constant(tweetsModel))
                }
                .listStyle(.plain)
                
            }
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(TweetData())
            .environmentObject(UserData())
    }
}
