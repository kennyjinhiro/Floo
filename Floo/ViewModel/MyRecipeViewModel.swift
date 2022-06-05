//
//  MyRecipeViewModel.swift
//  Floo
//
//  Created by Kenny Jinhiro_0706012010024 on 05/06/22.
//

import Foundation

class MyRecipeViewModel: ObservableObject{
    @Published var fav_recipes: [DetailedRecipe] = []
    @Published var recipe_favorite_id: [Int] = []
    func fetch_favorite(){
        
        var query_bulk_ids = ""
        
        //Decoded data = array
        let decoder = JSONDecoder()
        if let data = UserDefaults.standard.value(forKey: "recipe_id") as? Data {
            let decodedData = try? decoder.decode([Int].self, from: data)
            recipe_favorite_id = decodedData ?? []
        } else {
            recipe_favorite_id = []
        }
        
        for(index,id) in recipe_favorite_id.enumerated() {
            if (index == recipe_favorite_id.count - 1) {
                query_bulk_ids = query_bulk_ids + String(id)
            }else {
                query_bulk_ids = query_bulk_ids + String(id) + ","
            }
        }
        
        
        guard let url = URL(string: "https://api.spoonacular.com/recipes/informationBulk?apiKey=\(ApiKey.apiKey)&ids=\(query_bulk_ids)")else{
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
                    print(favorite_recipes)
                }
            }catch{
                print("JSON Catch MyRecipe")
            }
        }
        
        task.resume()
        
    }
}
