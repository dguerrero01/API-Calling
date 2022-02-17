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
                    destination: VStack {
                        Text(game.short_description)
                        Text(game.game_url)
                        Text(game.genre)
                        Text(game.platform)
                        .padding()
                    },
                    label: {
                            Text(game.title)
                    })
            }
            .navigationTitle("Games")
        }
        .onAppear(perform: {
            getGames()
        })
    }
    func getGames() {
        let apiKey = "?rapidapi-key=001b5c5e5emsh7fc081c3e3e9f4bp1b46f4jsn80c50e3dfd2c"
        let query = "https://free-to-play-games-database.p.rapidapi.com/api/games\(apiKey)"
        if let url = URL(string : query) {
            if let data = try? Data(contentsOf: url) {
                let json = try! JSON(data: data)
                let contents = json.arrayValue
                for item in contents {
                    let title = item["title"].stringValue
                    let short_description = item["short_description"].stringValue
                    let game_url = item["game_url"].stringValue
                    let genre = item["genre"].stringValue
                    let platform = item["platform"].stringValue
                    let game = Game(title: title, short_description: short_description, game_url: game_url, genre: genre, platform: platform)
                    games.append(game)
                }
                return
            }
            
        }
    }
}

struct Game : Identifiable {
    let id = UUID()
    var title : String
    var short_description : String
    var game_url : String
    var genre : String
    var platform : String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
