//
//  RecipeCard.swift
//  Floo
//
//  Created by Kenny Jinhiro_0706012010024 on 31/05/22.
//

import SwiftUI

struct ProfileRecipeCard: View {
    var recipe: DetailedRecipe
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: recipe.image ?? ""))
                .frame(width: 110, height: 110).cornerRadius(5)
            Text(recipe.title ?? "")
                .multilineTextAlignment(.center)
                .lineLimit(4).font(.system(size: 14, weight: .bold))
                .padding(.bottom,32.00)
                .frame(width: 110, height: 50)
            
        }.frame(width: 110, height: 160)
    }
}

struct ProfileRecipeCard_Previews: PreviewProvider {
    static var recipes = ViewModel().results
    static var previews: some View {
        RecipeCard(recipe: recipes[0]).previewLayout(.fixed(width: 150, height: 150))
    }
}
