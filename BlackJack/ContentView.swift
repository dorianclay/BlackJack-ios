//
//  ContentView.swift
//  BlackJack
//
//  Created by Dorian Clay on 8/9/22.
//

import SwiftUI


class idFormatter: Formatter {
    override func string(for obj: Any?) -> String? {
        guard let string = obj as? String,
              string.count == 17
        else { return nil }
        
        return string.split(separator: " ").joined(separator: "-")
    }
    
    
}


struct ContentView: View {
    @EnvironmentObject var gameMetadata: GameMetadata
    @State private var httpReturned = false
    
    func getGameId() -> Void {
        gameMetadata.gameId = "temp-create-game"
        httpReturned = true
    }
    
    func checkGameId() -> Void {
        httpReturned = true
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to BlackJack!")
                    .font(.title2)
                    .padding()
                Spacer()
                    .frame(height: 35.0)
                Button("Create Game", action: getGameId)
                    .padding()
                Text("or join existing")
                TextField("Game ID", text: $gameMetadata.gameId)
                    .keyboardType(.default)
                    .padding()
                    .multilineTextAlignment(.center)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Join Game", action: checkGameId)
                Spacer()
                NavigationLink("Hidden Join Game Link", isActive: $httpReturned) {
                    JoinGameView()
                }.hidden()
            }.navigationTitle("BlackJack")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.light)
                .environmentObject(GameMetadata(id: "", name: "Crash Dummy Craig"))
            ContentView()
                .preferredColorScheme(.dark)
                .environmentObject(GameMetadata(id: "", name: ""))
        }
    }
}
