//
//  FlooApp.swift
//  Floo
//
//  Created by Kenny Jinhiro_0706012010024 on 23/05/22.
//

import SwiftUI

@main
struct FlooApp: App {
    var body: some Scene {
        WindowGroup {
//            RecipeExplore()
            TabView {
                RecipeExplore()
                    .tabItem {
                        Image(systemName: "magnifyingglass.circle")
                            .renderingMode(.template)
                        Text("Explore")
                    }
                MyRecipeExplore()
                    .tabItem {
                        Image(systemName: "book.circle")
                            .renderingMode(.template)
                        Text("My Recipes")
                    }
                ProfileView()
                    .tabItem{
                        Image(systemName: "person.circle.fill")
                            .renderingMode(.template)
                        Text("Profile")
                    }
            }.accentColor(.black)
        }
    }
}
