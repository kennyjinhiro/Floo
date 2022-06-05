//
//  DetailViewModel.swift
//  Floo
//
//  Created by Kenny Jinhiro_0706012010024 on 03/06/22.
//

import Foundation
class DetailViewModel: ObservableObject{
    @Published var favorite: Bool = false
    @Published var detailedRecipe: DetailedRecipe?
    @Published var nutrients: [Flavonoid] = []
    @Published var recipe_id: [Int] = []
    
    func fetch_detail(id: Int){
        guard let url = URL(string: "https://api.spoonacular.com/recipes/\(id)/information?apiKey=\(ApiKey.apiKey)&includeNutrition=true")else{
            print("Does not work")
            return}

        let task = URLSession.shared.dataTask(with: url){[weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }

            //Decode to JSON
            do{
                let detailedRecipe = try JSONDecoder().decode(DetailedRecipe.self, from: data)
                DispatchQueue.main.async {
                    self?.detailedRecipe = detailedRecipe
                    print(detailedRecipe)
                    
                    //Decoded data = array
                    let decoder = JSONDecoder()
                    if let data = UserDefaults.standard.value(forKey: "recipe_id") as? Data {
                        let decodedData = try? decoder.decode([Int].self, from: data)
                        self?.recipe_id = decodedData ?? []
                    } else {
                        self?.recipe_id = []
                    }
                    
                    for id in self?.recipe_id ?? [] {
                        if (id == self?.detailedRecipe?.id) {
                            self?.favorite = true
                        }
                    }
                    
                }
                
                
                
            }catch{
                print("JSON Catch DetailedRecipe")
            }
        }

        task.resume()

    }
    
    func add_favorite(id: Int){
        
        //Decoded data = array
        let decoder = JSONDecoder()
        if let data = UserDefaults.standard.value(forKey: "recipe_id") as? Data {
            let decodedData = try? decoder.decode([Int].self, from: data)
            recipe_id = decodedData ?? []
        } else {
            recipe_id = []
        }
        print("Before Add:", recipe_id)
        recipe_id = Array(Set(recipe_id))
        recipe_id.append(id)
        recipe_id = Array(Set(recipe_id))
        print("After Add:", recipe_id)
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(recipe_id) {
            UserDefaults.standard.set(encodedData, forKey: "recipe_id")
        }
    }
    
    func remove_favorite(id: Int){
        
        //Decoded data = array
        let decoder = JSONDecoder()
        if let data = UserDefaults.standard.value(forKey: "recipe_id") as? Data {
            let decodedData = try? decoder.decode([Int].self, from: data)
            recipe_id = decodedData ?? []
        } else {
            recipe_id = []
        }
        
        for (index, recipe) in recipe_id.enumerated(){
            if (id == recipe){
                recipe_id = Array(Set(recipe_id))
                recipe_id.remove(at: index)
                recipe_id = Array(Set(recipe_id))
            }
        }
        
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(recipe_id) {
            UserDefaults.standard.set(encodedData, forKey: "recipe_id")
        }
    }
    
    func contain_favorite(id: Int)->Bool{
        recipe_id.contains(id)
    }
    
    
}
