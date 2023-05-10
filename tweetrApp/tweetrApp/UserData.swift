//
//  UserData.swift
//  ios-academy
//
//  Created by student on 12.12.2022..
//

import Foundation
import Combine

class UserData: ObservableObject {
    @Published var username: String = "username"
    @Published var image: String = "crow"
    @Published var favouriteTweets: Set<String> = [] // set koristimo jer ne mozemo imati dva ista tweeta u arrayu odnosno dva ista id-a
}
