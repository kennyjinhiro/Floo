//
//  ViewModel.swift
//  Floo
//
//  Created by Kenny Jinhiro_0706012010024 on 23/05/22.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject{
    @Published var recipes: Recipe?
    @Published var results: [Result] = []
    
//    func getRecipe(searchTerm: String) async throws -> [Recipe]{
//
//    }
    func fetch(){
        guard let url = URL(string: "https://api.spoonacular.com/recipes/complexSearch?apiKey=\(ApiKey.apiKey)")else{
            print("Does not work")
            return}
        
        let task = URLSession.shared.dataTask(with: url){[weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            //Decode to JSON
            do{
                let recipes = try JSONDecoder().decode(Recipe.self, from: data)
                DispatchQueue.main.async {
                    self?.results = recipes.results
                    self?.recipes = recipes
                }
            }catch{
                print("JSON Catch")
            }
        }
        
        task.resume()
        
    }
}
