//
//  GameView.swift
//  BlackJack
//
//  Created by Dorian Clay on 8/9/22.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var gameMetadata: GameMetadata
    
    var body: some View {
        VStack {
            Text(gameMetadata.gameId)
                .font(.title2)
                .bold()
            HStack {
                Text("Score")
                Text("--points--")
            }
            HStack {
                Text("Card1")
                Text("Card2")
                Text("Card3")
            }
            HStack {
                Text("<HIT>")
                Text("<STAY>")
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .environmentObject(GameMetadata(id: "slimy-lilac-crab", name: "Crash Dummy Craig"))
    }
}
