//
//  AddRecipeView.swift
//  Floo
//
//  Created by MacBook Pro on 08/05/2022.
//

import SwiftUI

struct MyRecipeAddRecipe: View {
//    @State private var name:String = ""
    @Environment(\.presentationMode) var presentationMode
    @State private var title:String = ""
    @State private var summary:String = ""
    @State private var calories:String = ""
    @State private var carbohydrates:String = ""
    @State private var proteins:String = ""
    @State private var calcium:String = ""
    @State private var idName: [String] = [""]
    @State private var idAmount: [String] = [""]
    @State private var idUnit: [String] = [""]
    @State private var instructions: [String] = [""]
    var body: some View {
//        NavigationView{
            ScrollView{
                VStack(alignment: .leading){
                    Group{
                    Text("General")
                        .font(.title2)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .padding(.top)
                    TextField("Recipe Title", text: $title).padding(.top,12)
                    Divider()
                    TextField("Recipe Summary", text: $summary).padding(.top, 24)
                    Divider()
                    }
                    Group{
                    Text("Nutritions")
                        .font(.title2)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .padding(.top, 24)
                    TextField("Calories (kCal)", text: $calories).padding(.top,12)
                    Divider()
                    TextField("Carbohydrates (gram)", text: $carbohydrates).padding(.top, 24)
                    Divider()
                    TextField("Protein (gram)", text: $proteins).padding(.top, 24)
                    Divider()
                    TextField("Calcium (gram)", text: $calcium).padding(.top, 24)
                    Divider()
                    }
                    Group{
                        Text("Ingredients")
                            .font(.title2)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .padding(.top, 24)
                        ForEach(0..<idName.count, id: \.self) { idx in
                            HStack {
                                TextField("Ingredient \(idx + 1)", text: self.$idName[idx])
                                Divider()
                                TextField("Amount", text: $idAmount[idx])
                                Divider()
                                TextField("Unit", text: $idUnit[idx])
                            }
                            Divider().padding(.top, 12)
                        }
                        Button {
                            self.idName.append("")
                            self.idAmount.append("")
                            self.idUnit.append("")
                        } label: {
                            HStack{
                                Spacer()
                                Text("Add More Ingredients").fontWeight(.bold).foregroundColor(Color.white)
                                Spacer()
                            }
                        }.padding(.all, 16).background(Color.blue).frame(height: 42, alignment: .center).cornerRadius(8.0).padding(.bottom, 24)
                            .padding(.top, 12)
                    }
                    Group{
                        Text("Instructions")
                            .font(.title2)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .padding(.top, 24)
                        ForEach(0..<instructions.count, id: \.self) { idx in
                            HStack {
                                TextField("Instruction \(idx + 1)", text: self.$instructions[idx])
                                    
                            }
                            Divider().padding(.top, 12)
                        }
                        Button {
                            self.instructions.append("")
                        }label: {
                            HStack{
                                Spacer()
                                Text("Add More Instruction").fontWeight(.bold).foregroundColor(Color.white)
                                Spacer()
                            }
                        }.padding(.all, 16).background(Color.blue).frame(height: 42, alignment: .center).cornerRadius(8.0).padding(.bottom, 24)
                            .padding(.top, 12)
                        Button {
//                            @State private var title:String = ""
//                            @State private var summary:String = ""
//                            @State private var calories:String = ""
//                            @State private var carbohydrates:String = ""
//                            @State private var proteins:String = ""
//                            @State private var calcium:String = ""
//                            @State private var idName: [String] = [""]
//                            @State private var idAmount: [String] = [""]
//                            @State private var idUnit: [String] = [""]
//                            @State private var instructions: [String] = [""]
                            var recipe: DetailedRecipe = DetailedRecipe()
                            var my_recipes: [DetailedRecipe] = []
                            recipe.title = title
                            recipe.summary = summary
                            recipe.nutrition = Nutrition()
                            recipe.extendedIngredients = [ExtendedIngredient]()
                            recipe.nutrition?.nutrients = [Flavonoid](repeating: Flavonoid(), count: 22)
                            recipe.analyzedInstructions = [AnalyzedInstruction](repeating: AnalyzedInstruction(), count: 1)
                            recipe.analyzedInstructions?[0].steps = [Step]()
                            recipe.nutrition?.nutrients?[0].amount = Double(calories)
                            recipe.nutrition?.nutrients?[3].amount = Double(carbohydrates)
                            recipe.nutrition?.nutrients?[8].amount = Double(proteins)
                            recipe.nutrition?.nutrients?[21].amount = Double(calcium)
                            var image_random:[String] = ["https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/AN_images/healthy-eating-ingredients-1296x728-header.jpg", "https://images.theconversation.com/files/368263/original/file-20201109-22-lqiq5c.jpg?ixlib=rb-1.1.0&rect=10%2C0%2C6699%2C4476&q=45&auto=format&w=926&fit=clip","https://quizizz.com/_media/questions/d4625bf8-21a3-4ac8-a0c5-799957945510_900_900"]
                            recipe.image = image_random[Int.random(in: 0..<3)]
                            for (i,ingredient) in idName.enumerated() {
                                var temp = ExtendedIngredient()
                                temp.name = ingredient
                                temp.amount = Double(idAmount[i])
                                temp.unit = idUnit[i]
                                recipe.extendedIngredients?.append(temp)
                            }
                            for instruction in instructions {
                                var temp = Step()
                                temp.step = instruction
                                recipe.analyzedInstructions?[0].steps?.append(temp)
                            }
                            let decoder = JSONDecoder()
                            if let data = UserDefaults.standard.value(forKey: "saved_recipe") as? Data {
                                        let taskData = try? decoder.decode([DetailedRecipe].self, from: data)
                                        my_recipes = taskData ?? []
                                    } else {
                                        my_recipes = []
                                    }
                            let id = my_recipes.count + 1
                            recipe.id = id + 1
                            my_recipes.append(recipe)
                            let encoder = JSONEncoder()
                            if let encoded = try? encoder.encode(my_recipes) {
                                UserDefaults.standard.set(encoded, forKey: "saved_recipe")
                            }
                            self.presentationMode.wrappedValue.dismiss()
                        }label:{
                            HStack{
                                Spacer()
                                Text("Submit").fontWeight(.bold).foregroundColor(.white)
                                Spacer()
                            }
                        }.padding(.all, 16).background(Color.blue).frame(height: 42, alignment: .center).cornerRadius(8.0).padding(.bottom, 24)
                            .padding(.top, 12)
                        
                        
                        
//                        .background(Color.blue).padding(.horizontal).frame(height: 42, alignment: .center).cornerRadius(8)
//                            .padding(.top, 12)
                        
                            
                    }
                    
                }.navigationTitle("Add Recipes")
                    .padding()
//                    .padding(.top, -100)
//            }
        }
    }
}

struct MyRecipeAddRecipe_Previews: PreviewProvider {
    static var previews: some View {
        MyRecipeAddRecipe()
    }
}
