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
            AsyncImage(url: URL(string: recipe.image))
                .frame(width: 170, height: 170).cornerRadius(5)
            Text(recipe.title)
                .multilineTextAlignment(.center)
                .lineLimit(4).font(.system(size: 14, weight: .bold))
                .padding(.bottom,48.00)
                .frame(width: 170, height: 90)
            
        }.frame(width: 170, height: 260)
    }
}

struct RecipeCard_Previews: PreviewProvider {
    static var recipes = ViewModel().results
    static var previews: some View {
        RecipeCard(recipe: recipes[0]).previewLayout(.fixed(width: 150, height: 150))
    }
}
