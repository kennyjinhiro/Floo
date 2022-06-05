//
//  MyRecipeExploreCard.swift
//  Floo
//
//  Created by Kenny Jinhiro_0706012010024 on 05/06/22.
//

import SwiftUI

struct MyRecipeExploreCard: View {
    var recipe: DetailedRecipe
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: recipe.image ?? "")){image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 160, height:  240)
                    .cornerRadius(5)
                    .brightness(-0.1)
                    .overlay(alignment: .center){
                        ImageOverlay(text: recipe.title ?? "Error")
                    }
                
            }placeholder: {
               ProgressView()
            }
                
            
        }
    }
}

struct MyRecipeExploreCard_Previews: PreviewProvider {
    static var previews: some View {
        MyRecipeExploreCard(recipe: DetailedRecipe())
    }
}

struct ImageOverlay: View {
    var text: String
    var body: some View {
        ZStack {
            Text(text)
                .fontWeight(.bold)
                .padding(6)
                .foregroundColor(.white)
                
        }
        .opacity(1)
        .cornerRadius(10.0)
        .padding(6)
    }
}

