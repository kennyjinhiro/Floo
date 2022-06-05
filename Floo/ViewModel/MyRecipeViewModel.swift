//
//  MyRecipeViewModel.swift
//  Floo
//
//  Created by Kenny Jinhiro_0706012010024 on 05/06/22.
//

import Foundation

class MyRecipeViewModel: ObservableObject{
    @Published var fav_recipes: [DetailedRecipe] = []
    
    func fetch_favorite(query: String){
        guard let url = URL(string: "https://api.spoonacular.com/recipes/informationBulk?apiKey=\(ApiKey.apiKey)&ids=\(query)")else{
            print("Does not work")
            return}
        
        let task = URLSession.shared.dataTask(with: url){[weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            //Decode to JSON
            do{
                let favorite_recipes = try JSONDecoder().decode([DetailedRecipe].self, from: data)
                DispatchQueue.main.async {
                    self?.fav_recipes = favorite_recipes
                }
            }catch{
                print("JSON Catch MyRecipe")
            }
        }
        
        task.resume()
        
    }
}
