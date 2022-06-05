//
//  AddRecipeView.swift
//  Floo
//
//  Created by MacBook Pro on 08/05/2022.
//

import SwiftUI

struct MyRecipeAddRecipe: View {
    @State private var name:String = ""
    @State private var description:String = ""
    @State private var nationality:String = ""
    @State private var calories:String = ""
    @State private var carbo:String = ""
    @State private var protein:String = ""
    @State private var fat:String = ""
    @State private var amountIngredients: [String] = []
    @State private var nameIngredients: [String] = []
    @State private var unitIngredients: [String] = []
    
    
    var body: some View {
    ScrollView {
        VStack {
        Text("Add Recipe")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding([.top, .leading])
                .frame(maxWidth: .infinity, alignment: .leading)
        
            VStack {
                VStack {
                    Text("General")
                        .font(.title)
                        .fontWeight(.medium)
                        .padding(.leading, 25.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                TextField("Name", text: $name)
                        .padding(.horizontal, 30).padding(.trailing, 20)
                Divider()
                 .padding(.horizontal, 30)
                
                TextField("Description", text: $description)
                        .padding(.horizontal, 30).padding([.top, .trailing], 20)
                    
                Divider()
                 .padding(.horizontal, 30)
                
//                TextField("Nationality / Origin", text: $nationality)
//                        .padding(.horizontal, 30).padding([.top, .trailing], 20)
//                Divider()
//                 .padding(.horizontal, 30)
                
                }
                .padding(.top)
                
                
                VStack {
                    Text("Nutritions")
                        .font(.title)
                        .fontWeight(.medium)
                        .padding(.leading, 25.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("Calories (Kcal)", text: $calories)
                        .padding(.horizontal, 30)
                    Divider()
                     .padding(.horizontal, 30)
                    
                    TextField("Carbohydrates (Gram)", text: $carbo)
                        .padding(.horizontal, 30).padding([.top, .trailing], 20)
                    Divider()
                     .padding(.horizontal, 30)
                    
                    TextField("Protein (Gram)", text: $protein)
                        .padding(.horizontal, 30).padding([.top, .trailing], 20)
                    Divider()
                     .padding(.horizontal, 30)
                    TextField("Fat (Gram)", text: $fat)
                        .padding(.horizontal, 30).padding([.top, .trailing], 20)
                    Divider()
                     .padding(.horizontal, 30)
                }
                .padding(.vertical)
                
                
                
                VStack {
                    Text("Ingredients")
                        .font(.title)
                        .fontWeight(.medium)
                        .padding(.leading, 25.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    ForEach(0..<amountIngredients.count, id: \.self) {i in
                    HStack {
                        TextField("Ingredient \(i+1)", text: $nameIngredients[i])
                            .padding(.leading, 20.0)
                        VStack {
                        TextField("Amount", text: $amountIngredients[i])
                           .font(/*@START_MENU_TOKEN@*/.footnote/*@END_MENU_TOKEN@*/)
                        TextField("Unit", text: $unitIngredients[i])
                           .font(/*@START_MENU_TOKEN@*/.footnote/*@END_MENU_TOKEN@*/)
                                
                        }
                    }
                }
                    Button{
                        unitIngredients.append("")
                        amountIngredients.append("")
                        nameIngredients.append("")
                    }label : {
                        Text("Add More Ingredients")
                    }
                    .padding(.all, 15.0)
                    .frame(maxWidth: 240, alignment: .center)
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.541, saturation: 0.997, brightness: 1.0)/*@END_MENU_TOKEN@*/)
                    .cornerRadius(10)
                    .padding(.all, 15.0)
                    
                    
                    Button{
                        var myRecipes: [DetailedRecipe] = [DetailedRecipe]()
                        var recipe:DetailedRecipe = DetailedRecipe()
                        recipe.title = name
                        recipe.summary = description
                        recipe.nutrition = Nutrition()
                        recipe.extendedIngredients = [ExtendedIngredient]()
                        recipe.nutrition?.nutrients = [Flavonoid]()
                        recipe.nutrition?.nutrients?[0].amount = Double(calories)
                        recipe.nutrition?.nutrients?[3].amount = Double(carbo)
                        recipe.nutrition?.nutrients?[8].amount = Double(protein)
                        recipe.nutrition?.nutrients?[1].amount = Double(fat)
                        for (i,ingredient) in nameIngredients.enumerated() {
                         var ingredientTemp = ExtendedIngredient()
                            ingredientTemp.name = ingredient
                            ingredientTemp.unit = unitIngredients[i]
                            ingredientTemp.amount = Double(amountIngredients[i])
                            recipe.extendedIngredients?.append(ingredientTemp)
                        }
                        let decoder = JSONDecoder()
                        if let data = UserDefaults.standard.value(forKey: "recipes") as? Data {
                                    let taskData = try? decoder.decode([DetailedRecipe].self, from: data)
                                    myRecipes = taskData ?? []
                                } else {
                                    myRecipes = []
                                }
                        myRecipes.append(recipe)
                        let encoder = JSONEncoder()
                        if let encoded = try? encoder.encode(myRecipes) {
                            UserDefaults.standard.set(encoded, forKey: "recipes")
                     }

                        
                        
                    }label : {
                        Text("Submit Recipe")
                    }
                    .padding(.all, 15.0)
                    .frame(maxWidth: 240, alignment: .center)
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.541, saturation: 0.997, brightness: 1.0)/*@END_MENU_TOKEN@*/)
                    .cornerRadius(10)
                    .padding(.all, 15.0)
    
                }
                
            }
        }
            
        }
    }
}

struct MyRecipeAddRecipe_Previews: PreviewProvider {
    static var previews: some View {
        MyRecipeAddRecipe()
    }
}
