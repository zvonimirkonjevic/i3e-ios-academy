//
//  ios_academyApp.swift
//  ios-academy
//
//  Created by student on 10.12.2022..
//


import SwiftUI

/*struct Bird{
    var greeting: String { // computed
        return "Chirp!"    // property
    }
    
    func greet(){
        print("Hello.")
    }
}

func getFullName(first: String, last: String) -> String {
    return first + " " + last
}

func preformAction(array: [Int], action: (Int) -> Int){ // higer-order function
    for number in array{
        let newNumber = action(number)
        print(newNumber)
    }
}

    func test(){
    //let bird = Bird()
    //bird.greet()
    // let greeting: String = "Hello!" --> eksplicitna deklaracija varijable, s let deklariramo konstante
    //bird.greeting
    
    var nameJoin: (String, String) -> String = getFullName // funkcija koja prima dva parametra tipa string i vraca jedan tipa string - primjer first class functiona
    
    let name = "name"
    
    name
    
    "name" // string literal
    
    ["ime","prezime"] // array literal
    
   nameJoin = {param1 , param2 in    // function literal
        return param1 + " " + param2
    }
    
    preformAction(array: [1,2,3], action: { number in // function literal
        return number+1
    })
    
    preformAction(array: [1,2,3]) { number in
        return number+2
    }
}*/

@main
struct twitter_clone_ios_academyApp: App {
    
    @StateObject var tweetData = TweetData() // instanciranje klase TweetData koja sadrzava sve trenutne tweetove, StateObject spoj @State anotacije i ObservableObjecta, pretvara TweetData u State object koji se na promjenu unutar TweetData i sam mijenja
    
    @StateObject var userData = UserData()
    var body: some Scene {
        WindowGroup {
            TabView{
                ContentView()
                    .tabItem {
                        Label("Feed", systemImage: "list.bullet.circle")
                    }
                SearchView()
                    .tabItem{
                        Label("Search", systemImage: "magnifyingglass.circle")
                    }
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.circle")
                    }
            }
            .environmentObject(tweetData)
            .environmentObject(userData)
        }
    }
}
