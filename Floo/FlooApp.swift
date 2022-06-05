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
                        Image(systemName: "safari.fill")
                            .renderingMode(.template)
                        Text("Explore")
                    }
                MyRecipeExplore()
                    .tabItem {
                        Image(systemName: "fork.knife")
                            .renderingMode(.template)
                        Text("My Recipes")
                    }
            }.accentColor(.black)
        }
    }
}
