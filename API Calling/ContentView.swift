//
//  ContentView.swift
//  API Calling
//
//  Created by Student on 2/3/22.
//

import SwiftUI

struct ContentView: View {
    @State private var games = [Game]()
    var body: some View {
        NavigationView {
            List (games)  { game in
                NavigationLink(
                    destination: Text(game.game_url)
                        .padding(),
                    label: {
                        Text(game.title)
                    })
            }
            .navigationTitle("Games")
        }
    }
}

struct Game : Identifiable {
    let id = UUID()
    var title : String
    var game_url : String
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
