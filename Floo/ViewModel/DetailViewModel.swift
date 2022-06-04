//
//  DetailViewModel.swift
//  Floo
//
//  Created by Kenny Jinhiro_0706012010024 on 03/06/22.
//

import Foundation
class DetailViewModel: ObservableObject{
    
    @Published var detailedRecipe: DetailedRecipe?
    @Published var nutrients: [Flavonoid] = []
    
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
                }
            }catch{
                print("JSON Catch DetailedRecipe")
            }
        }

        task.resume()

    }
}
