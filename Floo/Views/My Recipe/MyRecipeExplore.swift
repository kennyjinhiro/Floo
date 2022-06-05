//
//  MyRecipeExplore.swift
//  Floo
//
//  Created by Kenny Jinhiro_0706012010024 on 05/06/22.
//

import SwiftUI

struct MyRecipeExplore: View {
    @StateObject var viewModel = MyRecipeViewModel()
    var body: some View {
        NavigationView{
            VStack(alignment: .leading, spacing: 16){
                Text("Favourites").font(.title2).fontWeight(.bold).multilineTextAlignment(.leading).padding(.top,12)
                ScrollView(.horizontal){
                    HStack{
                        ForEach(viewModel.fav_recipes, id: \.self) { recipe in
                            NavigationLink {
                                RecipeDetail(index: recipe.id!)
                            } label: {
                                MyRecipeExploreCard(recipe: recipe)
                            }
                        }
                    }
                }.padding(.top, 12)
                Text("Saved Recipes").font(.title2).fontWeight(.bold).multilineTextAlignment(.leading)
                ScrollView(.horizontal){
                    
                }.padding(.top, 12)
//                NavigationLink{
//
//                }
            }.padding(.horizontal)
                .padding(.leading, 4)
            .navigationTitle("My Recipes")
            .onAppear{
                viewModel.fetch_favorite()
            }
        }
    }
}

struct MyRecipeExplore_Previews: PreviewProvider {
    static var previews: some View {
        MyRecipeExplore()
    }
}
