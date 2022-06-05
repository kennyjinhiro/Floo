//
//  RecipeDetail.swift
//  Floo
//
//  Created by Kenny Jinhiro_0706012010024 on 31/05/22.
//

import SwiftUI

struct RecipeDetail: View {
    @State var index: Int
    @State var recipe: Result
//    @State var recipe: Result
    @StateObject var viewModel = DetailViewModel()
    var body: some View {
        NavigationView{
            ScrollView {
                VStack{
                    AsyncImage(url: URL(string: viewModel.detailedRecipe?.image ?? "")) { phase in
                    switch phase {
                    case .success(let image):
                        image.resizable()
                            .ignoresSafeArea()
                    default: Color.gray // <-- here
                    }
                }.frame(width: 428, height: 280, alignment: .topLeading).cornerRadius(5)
                    VStack(alignment: .leading) {
                    HStack{
                        Text(viewModel.detailedRecipe?.title ?? "")
                            .font(.title2)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .padding(.trailing, 32.0)
                        .padding(.leading, 16.0)
                        
                        Spacer()
                        
                       //hati
                        Image(systemName: viewModel.contain_favorite(id: viewModel.detailedRecipe?.id ?? 0) ? "heart.fill" : "heart")
                        .foregroundColor(viewModel.contain_favorite(id: viewModel.detailedRecipe?.id ?? 0) ? .pink : .gray)
                        .padding(.top)
                        .padding(.trailing, 32)
                        .frame(width: 70.0, height: 70.0)
                        .onTapGesture {
                            (viewModel.contain_favorite(id: viewModel.detailedRecipe?.id ?? 0) == false) ? viewModel.add_favorite(id: viewModel.detailedRecipe?.id ?? 0) : viewModel.remove_favorite(id: viewModel.detailedRecipe?.id ?? 0)
                           
                        }
                    }
                    Text(viewModel.detailedRecipe?.summary?.trimHTMLTags() ?? "")
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
                                    Text(String(viewModel.detailedRecipe?.nutrition?.nutrients?[0].amount ?? 0.0)).font(.title2).fontWeight(.bold).multilineTextAlignment(.leading).padding(.trailing, 12.0).foregroundColor(Color.darkred)
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
                                    Text(String(viewModel.detailedRecipe?.nutrition?.nutrients?[3].amount ?? 0.0)).font(.title2).fontWeight(.bold).multilineTextAlignment(.leading)
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
                                    Text(String(viewModel.detailedRecipe?.nutrition?.nutrients?[8].amount ?? 0.0)).font(.title2).fontWeight(.bold).multilineTextAlignment(.leading)
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
                                    Text(String(viewModel.detailedRecipe?.nutrition?.nutrients?[21].amount ?? 0.0)).font(.title2).fontWeight(.bold).multilineTextAlignment(.leading)
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
                    ForEach(viewModel.detailedRecipe?.extendedIngredients ?? [ExtendedIngredient]()) { ingredient in
                        Text(ingredient.original ?? "Ingredient")
                        .padding(.top, 4.0)
                        .padding(.horizontal)
                    }
                    Text("Instructions")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 4.0)
                        .padding(.horizontal)
                    if(viewModel.detailedRecipe?.analyzedInstructions?.count ?? 0 > 0) {
                        ForEach(Array((viewModel.detailedRecipe?.analyzedInstructions?[0].steps ?? [Step]())), id: \.number) { instruction in
                            Text(instruction.step ?? "")
                            .padding(.top, 4.0)
                            .padding(.horizontal)
                        }
                    }else{
                        Text("No Instructions in API")
                            .padding(.top, 4.0)
                            .padding(.horizontal)
                    }
                
                    Spacer()
                    }
                    .padding(.horizontal)
            }.onAppear{viewModel.fetch_detail(id: index)}
            .padding(.top, -200)
            .navigationBarHidden(true)
            
            }
        }.accentColor(.black)
//
    }
}

struct RecipeDetail_Previews: PreviewProvider {
    static var recipes = ViewModel().results
    static var previews: some View {
        RecipeDetail(index: 716426, recipe: recipes[0] ).environmentObject(ViewModel())
    }
}

extension String {
    public func trimHTMLTags() -> String? {
        guard let htmlStringData = self.data(using: String.Encoding.utf8)else{
            return nil
        }
    
        let options: [NSAttributedString.DocumentReadingOptionKey : Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
    
        let attributedString = try? NSAttributedString(data: htmlStringData, options: options, documentAttributes: nil)
        return attributedString!.string
    }
}

extension Color{
    static let maroon = Color("Maroon")
    static let lightgreen = Color("LightGreen")
    static let purple = Color("Purple")
    static let blue = Color("Blue")
    static let darkred = Color("DarkRed")
    static let lightergreen = Color("LighterGreen")
    static let lightpurple = Color("LightPurple")
    static let lighterblue = Color("LighterBlue")
}
