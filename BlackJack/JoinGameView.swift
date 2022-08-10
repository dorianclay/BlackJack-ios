//
//  JoinGameView.swift
//  BlackJack
//
//  Created by Dorian Clay on 8/9/22.
//

import SwiftUI

struct JoinGameView: View {
    @EnvironmentObject var gameMetadata: GameMetadata
    @State private var ready = false
    
    func readyUp() -> Void {
        ready = true
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("You have joined game")
                Text(gameMetadata.gameId)
                    .font(.title2)
                    .bold()
                Text("Enter a name:")
                TextField("Name", text: $gameMetadata.playerName)
                    .keyboardType(.default)
                    .padding()
                Button("Ready", action: readyUp)
            }.navigationTitle("Lobby")
        }
    }
}

struct JoinGameView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            JoinGameView()
                .preferredColorScheme(.light)
                .environmentObject(GameMetadata(id: "slimy-lilac-crab", name: "Crash Dummy Craig"))
            JoinGameView()
                .preferredColorScheme(.dark)
                .environmentObject(GameMetadata(id: "slimy-lilac-crab", name: "Crash Dummy Craig"))
        }
    }
}
