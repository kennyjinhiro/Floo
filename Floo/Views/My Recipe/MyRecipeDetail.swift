
//
//  RecipeDetail.swift
//  Floo
//
//  Created by Kenny Jinhiro_0706012010024 on 31/05/22.
//

import SwiftUI

struct MyRecipeDetail: View {
    @Environment(\.presentationMode) var presentationMode
    @State var recipe: DetailedRecipe
//    @State var recipe: Result
    @State private var favorite: Bool = false
//    @State var recipe: Result
//    @StateObject var viewModel = MyRecipeViewModel()
    var body: some View {
        NavigationView{
            ScrollView {
                VStack{
                    AsyncImage(url: URL(string: recipe.image ?? "")) { phase in
                    switch phase {
                    case .success(let image):
                        image.resizable()
                            .ignoresSafeArea()
                    default: Color.gray // <-- here
                    }
                }.frame(width: 428, height: 280, alignment: .topLeading).cornerRadius(5)
                    VStack(alignment: .leading) {
                    HStack{
                        Text(recipe.title ?? "")
                            .font(.title2)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .padding(.trailing, 32.0)
                        .padding(.leading, 16.0)
                        
                        Spacer()
                        
//                        Image(systemName: viewModel.contain_favorite(id: recipe?.id ?? 0) ? "heart.fill" : "heart")
//                        .foregroundColor(viewModel.contain_favorite(id: recipe?.id ?? 0) ? .pink : .gray)
                        
//                        .frame(width: 70.0, height: 70.0)
//                        .onTapGesture {
//                            (viewModel.contain_favorite(id: recipe?.id ?? 0) == false) ? viewModel.add_favorite(id: recipe?.id ?? 0) : viewModel.remove_favorite(id: recipe?.id ?? 0)
//
//                        }
                    }
                    Text(recipe.summary?.trimHTMLTags() ?? "")
                        .padding(.top, 4.0)
                        .padding(.horizontal)
                    Text("Nutritions")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 4.0)
                        .padding(.horizontal)
                    HStack{
                        //card 1
                        ZStack {
                        RoundedRectangle(cornerRadius: 5.0)
                                .strokeBorder(SwiftUI.Color.white, lineWidth: 0)
                                .frame(width: 190.0, height: 70.0)
                                .background(Color.maroon)
                                .cornerRadius(5.0)
                            VStack(alignment: .leading, spacing: 10) {
                                HStack(spacing: 2){
                                    Text(String(recipe.nutrition?.nutrients?[0].amount ?? 0.0)).font(.title2).fontWeight(.bold).multilineTextAlignment(.leading).padding(.trailing, 12.0).foregroundColor(Color.darkred)
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text("Calcium")
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.white)
                                        Text("Gram")
                                            .foregroundColor(Color.white)
                                    }
                                }
                                .padding(.horizontal,12.0)
                                .padding(.bottom,8)
                            }
                            .frame(width: 190.0, height: 70.0)
                            .cornerRadius(5)
                        }.padding(.leading, 16.0)
                        Spacer()
                        //card 2
                        ZStack {
                        RoundedRectangle(cornerRadius: 5.0)
                                .strokeBorder(SwiftUI.Color.white, lineWidth: 0)
                                .frame(width: 190.0, height: 70.0)
                                .background(Color.lightgreen)
                                .cornerRadius(5.0)
                            VStack(alignment: .leading, spacing: 10) {
                                HStack(spacing: 2){
                                    Text(String(recipe.nutrition?.nutrients?[3].amount ?? 0.0)).font(.title2).fontWeight(.bold).multilineTextAlignment(.leading)
                                        .padding(.trailing).foregroundColor(Color.lightergreen)
                                    
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text("Carbo")
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.white)
                                        Text("Gram")
                                            .foregroundColor(Color.white)
                                    }
                                }
                                .padding(.horizontal,12.0)
                                .padding(.bottom,8)
                            }
                            .frame(width: 190.0, height: 70.0)
                            .cornerRadius(5)
                        }.padding(.trailing, 24.0)
                    }
                    HStack{
                        //card 1
                        ZStack {
                        RoundedRectangle(cornerRadius: 5.0)
                                .strokeBorder(SwiftUI.Color.white, lineWidth: 0)
                                .frame(width: 190.0, height: 70.0)
                                .background(Color.purple)
                                .cornerRadius(5.0)
                            VStack(alignment: .leading, spacing: 10) {
                                HStack(spacing: 2){
                                    Text(String(recipe.nutrition?.nutrients?[8].amount ?? 0.0)).font(.title2).fontWeight(.bold).multilineTextAlignment(.leading)
                                        .padding(.trailing).foregroundColor(Color.lightpurple)
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text("Protein")
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.white)
                                        Text("Gram")
                                            .foregroundColor(Color.white)
                                    }
                                }
                                .padding(.horizontal,12.0)
                                .padding(.bottom,8)
                            }
                            .frame(width: 190.0, height: 70.0)
                            .cornerRadius(5)
                        }.padding(.leading, 16.0)
                        Spacer()
                        //card 2
                        ZStack {
                        RoundedRectangle(cornerRadius: 5.0)
                                .strokeBorder(SwiftUI.Color.white, lineWidth: 0)
                                .frame(width: 190.0, height: 70.0)
                                .background(Color.blue)
                                .cornerRadius(5.0)
                            VStack(alignment: .leading, spacing: 10) {
                                HStack(spacing: 2){
                                    Text(String(recipe.nutrition?.nutrients?[21].amount ?? 0.0)).font(.title2).fontWeight(.bold).multilineTextAlignment(.leading)
                                        .padding(.trailing).foregroundColor(Color.lighterblue)
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text("Calcium")
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.white)
                                        Text("Gram")
                                            .foregroundColor(Color.white)
                                    }
                                }
                                .padding(.horizontal,12.0)
                                .padding(.bottom,8)
                            }
                            .frame(width: 190.0, height: 70.0)
                            .cornerRadius(5)
                        }.padding(.trailing, 24.0)
                    }
                    Text("Ingredients")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 4.0)
                        .padding(.horizontal)
                        
                        ForEach(Array((recipe.extendedIngredients ?? [ExtendedIngredient]()).enumerated()), id: \.offset) { i, ingredient in
                        HStack{
                            Text(ingredient.name ?? "Ingredient")
                            Text(String(ingredient.amount ?? 0.0))
                            Text(ingredient.unit ?? "Unknown")
                            Spacer()
                        }.padding(.top, 4.0)
                            .padding(.horizontal)
                        }
                    Text("Instructions")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 4.0)
                        .padding(.horizontal)
                    if(recipe.analyzedInstructions?.count ?? 0 > 0) {
                        ForEach(Array((recipe.analyzedInstructions?[0].steps ?? [Step]()).enumerated()), id: \.offset) { i, instruction in
                            Text(instruction.step ?? "")
                            .padding(.top, 4.0)
                            .padding(.horizontal)
                        }
                    }else{
                        Text("No Instructions in API")
                            .padding(.top, 4.0)
                            .padding(.horizontal)
                    }
                    Button{
                        var check_recipe : [DetailedRecipe] = []
                        //Decoded data = array
                        let decoder = JSONDecoder()
                        if let data = UserDefaults.standard.value(forKey: "saved_recipe") as? Data {
                            let decodedData = try? decoder.decode([DetailedRecipe].self, from: data)
                            check_recipe = decodedData ?? []
                        } else {
                            check_recipe = []
                        }
                        
                        for (idx,recipe_in_check) in check_recipe.enumerated(){
                            if (recipe == recipe_in_check){
                                check_recipe.remove(at:idx)
                            }
                        }
                        
                        let encoder = JSONEncoder()
                        if let encodedData = try? encoder.encode(check_recipe) {
                            UserDefaults.standard.set(encodedData, forKey: "saved_recipe")
                        }
                        self.presentationMode.wrappedValue.dismiss()
                    }label:{
                        HStack(alignment: .center){
                            Spacer()
                            Text("Delete Recipe").fontWeight(.bold).foregroundColor(.white)
                            Spacer()
                        }
                    }.padding(.all, 16).background(Color.blue).frame(height: 42, alignment: .center).cornerRadius(8.0).padding(.bottom, 24)
                            .padding(.top, 12).padding(.horizontal, 48)
//                    Spacer()
                    }
                    .padding(.horizontal)
            }
            .padding(.top, -200)
            .navigationBarHidden(true)
            
            }
        }.accentColor(.black)
//
    }
}

struct MyRecipeDetail_Previews: PreviewProvider {
    static var previews: some View {
       //No code
        RecipeExplore()
    }
}
