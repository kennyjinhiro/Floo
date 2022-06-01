//
//  RecipeCard.swift
//  Floo
//
//  Created by Kenny Jinhiro_0706012010024 on 31/05/22.
//

import SwiftUI

struct RecipeCard: View {
    var recipe: Result
    
    var body: some View {
        VStack(alignment: .leading) {
            URLImage(url_image: recipe.image, cardAndImageWidth: 170, cardHeight: 170, imageHeight: 170, cornerRadius: 5)
            Text(recipe.title)
                .multilineTextAlignment(.leading)
                .lineLimit(3).font(.system(size: 14, weight: .bold))
            .padding(.bottom,12)
        }
    }
}

struct RecipeCard_Previews: PreviewProvider {
    static var recipes = ViewModel().results
    static var previews: some View {
        RecipeCard(recipe: recipes[0]).previewLayout(.fixed(width: 150, height: 150))
    }
}
