//
//  ContentView.swift
//  Floo
//
//  Created by Kenny Jinhiro_0706012010024 on 23/05/22.
//

import SwiftUI

struct RecipeExplore: View {
    @State private var search_var = ""
    @StateObject var viewModel = ViewModel()
    let columns = [GridItem(),
                   GridItem()]
    private let cardAndImageWidth: CGFloat = 170
    private let cardHeight: CGFloat = 240
    private let imageHeight: CGFloat = 170
    private let cornerRadius: CGFloat = 5
    var body: some View {
        NavigationView{
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.results, id: \.self){ recipe in
                        ZStack {
                                RoundedRectangle(cornerRadius: cornerRadius)
                                    .strokeBorder(SwiftUI.Color.white, lineWidth: 1)
                                    .frame(width: cardAndImageWidth, height: cardHeight)
                                    .background(SwiftUI.Color.white)
//                            Text(String(recipe.id))
                                NavigationLink{
                                    RecipeDetail(index: recipe.id)
                                } label:{
                                    RecipeCard(recipe: recipe)
                                }.tag(recipe)
                                .frame(width: cardAndImageWidth, height: cardHeight)
                                .cornerRadius(cornerRadius)
                                .buttonStyle(PlainButtonStyle())
                        }.padding(4)
                    }
                }
            }.navigationTitle("Explore Recipes")
        }.onAppear{
                viewModel.fetch()
        }.searchable(text: $search_var)
        .onSubmit(of: .search) {
            viewModel.search(query: search_var)
        }
        .onChange(of: search_var) { search in
            if (search.isEmpty) {
                viewModel.fetch()
            }
        }
        
    }
}


struct RecipeExplore_Previews: PreviewProvider {
    static var previews: some View {
        RecipeExplore()
    }
}
