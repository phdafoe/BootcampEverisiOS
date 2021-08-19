//
//  ContentView.swift
//  EverisMovies
//
//  Created by Andres Felipe Ocampo Eljaiek on 18/8/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            MoviesCoordinator.navigation()
                .tabItem {
                    VStack{
                        Image(systemName: "tv")
                        Text("Movies")
                    }
                }
            MoviesCoordinator.navigation()
                .tabItem {
                    VStack{
                        Image(systemName: "tv")
                        Text("Movies")
                    }
                }
            MoviesCoordinator.navigation()
                .tabItem {
                    VStack{
                        Image(systemName: "tv")
                        Text("Movies")
                    }
                }
            MoviesCoordinator.navigation()
                .tabItem {
                    VStack{
                        Image(systemName: "tv")
                        Text("Movies")
                    }
                }
            MoviesCoordinator.navigation()
                .tabItem {
                    VStack{
                        Image(systemName: "tv")
                        Text("Movies")
                    }
                }
            MoviesCoordinator.navigation()
                .tabItem {
                    VStack{
                        Image(systemName: "tv")
                        Text("Movies")
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
