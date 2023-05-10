//
//  SearchView.swift
//  ios-academy
//
//  Created by student on 12.12.2022..
//

import SwiftUI

struct SearchView: View {
    
    @EnvironmentObject var tweetData: TweetData
    
    @State var query: String = "" // uvjet za filtriranje tweets arraya

    var foundTweets: [TweetModel] { // vraca novi array koji je podskup tweets arrya s filtriranim vrijednostima iz tweets
        return tweetData.tweets.filter {tweet in
            return tweet.content.lowercased()
                .contains(query.lowercased())
        }
    }
    
    var body: some View {
        VStack{
            TextField("Search", text: $query) // search bar
                .padding([.top, .leading, .trailing], 20.0)
                .textFieldStyle(.roundedBorder)
            
            Spacer()
            
            List(foundTweets) { tweetModel in // prikazuje array foundTweets
                TweetPost( tweet:
                        Binding.constant(tweetModel))
            }
            .listStyle(.plain)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .environmentObject(TweetData())
    }
}
