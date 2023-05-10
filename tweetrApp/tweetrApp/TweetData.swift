//
//  TweetData.swift
//  ios-academy
//
//  Created by student on 12.12.2022..
//

import Foundation
import Combine

class TweetData : ObservableObject {
    @Published var tweets: [TweetModel] = []
    
    @MainActor @Sendable// oznacava da ju pokrecemo iz main threda ali obavlja stvari u pozadini
    func fetchTweets() async {
        do{
            // skinit JSON
            let url = URL(string: "https://birdy-da9a8-default-rtdb.europe-west1.firebasedatabase.app/tweets.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            // dekodirat JSON
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let json = try decoder.decode([String: TweetModel].self, from: data)
            // postaviti tweets
            tweets = [TweetModel](json.values)
        } catch let error {
            print(error)
        }
            
    }
}
