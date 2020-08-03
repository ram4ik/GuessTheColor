//
//  GuessTheColorApp.swift
//  GuessTheColor
//
//  Created by ramil on 03.08.2020.
//

import SwiftUI

@main
struct GuessTheColorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(rGuess: 0.5, gGuess: 0.5, bGuess: 0.5)
        }
    }
}
