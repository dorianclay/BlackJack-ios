//
//  BlackJackApp.swift
//  BlackJack
//
//  Created by Dorian Clay on 8/9/22.
//

import SwiftUI

class GameMetadata: ObservableObject {
    @Published var gameId = ""
    @Published var playerName = ""
    
    init() {}
    
    init(id: String, name: String) {
        gameId = id
        playerName = name
    }
}

@main
struct BlackJackApp: App {
    @StateObject private var gameMetadata = GameMetadata()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(gameMetadata)
        }
    }
}
