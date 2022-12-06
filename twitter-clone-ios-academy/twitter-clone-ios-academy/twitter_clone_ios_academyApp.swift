//
//  twitter_clone_ios_academyApp.swift
//  twitter-clone-ios-academy
//
//  Created by student on 06.12.2022..
//

import SwiftUI

struct Bird{
    var greeting: String { // computed
        return "Chirp!"    // property
    }
    
    func greet(){
        print("Hello.")
    }
}

func test(){
    let bird = Bird()
    //bird.greet()
    // let greeting: String = "Hello!" --> eksplicitna deklaracija varijable, s let deklariramo konstante
    bird.greeting
}

@main
struct twitter_clone_ios_academyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
