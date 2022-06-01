//
//  RecipeDetail.swift
//  Floo
//
//  Created by Kenny Jinhiro_0706012010024 on 31/05/22.
//

import SwiftUI

struct RecipeDetail: View {
    @EnvironmentObject var viewModel: ViewModel
    var recipe: Result

    var recipeIndex: Int {
        ViewModel().results.firstIndex(where: { $0.id == recipe.id })!
    }
    
    var body: some View {
        ScrollView {
            URLImage(url_image: recipe.image, cardAndImageWidth: 430, cardHeight: 240, imageHeight: 240, cornerRadius: 5)
            VStack(alignment: .leading) {
            }
                
        }
        .navigationTitle("Back to Explore")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct RecipeDetail_Previews: PreviewProvider {
    static let recipe = ViewModel().results
    static var previews: some View {
        RecipeDetail(recipe: recipe[0])
            .environmentObject(ViewModel())
    }
}
