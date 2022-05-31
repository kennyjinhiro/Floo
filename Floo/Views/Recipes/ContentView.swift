//
//  ContentView.swift
//  Floo
//
//  Created by Kenny Jinhiro_0706012010024 on 23/05/22.
//

import SwiftUI

struct URLImage: View{
    let url_image:String
    @State var data: Data?
    var body: some View{
        if let data = data, let uiimage = UIImage(data: data){
            Image(uiImage: uiimage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: cardAndImageWidth, height: imageHeight).cornerRadius(5)
                .clipped()
        }else{
            Image(systemName: "None")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: cardAndImageWidth, height: imageHeight)
                .clipped().background(Color.gray).onAppear{
                fetchData()
            }
        }
    }
    private func fetchData(){
        guard let url = URL(string: url_image) else{
            return
        }
        let task = URLSession.shared.dataTask(with: url){data, _, _ in self.data = data}
        task.resume()
    }
    private let cardAndImageWidth: CGFloat = 170
    private let cardHeight: CGFloat = 170
    private let imageHeight: CGFloat = 170
    private let cornerRadius: CGFloat = 5
}

struct ContentView: View {
    @State private var search_var = ""
    @StateObject var viewModel = ViewModel()
    let columns = [GridItem(),
                   GridItem()]
    var body: some View {
        NavigationView{
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.results, id: \.self){ recipe in
                        ZStack {
                                RoundedRectangle(cornerRadius: cornerRadius)
                                    .strokeBorder(SwiftUI.Color.white, lineWidth: 1)
                                    .frame(width: cardAndImageWidth, height: cardHeight)
                                    .background(SwiftUI.Color.white)
                                NavigationLink{
                                    RecipeDetail()
                                } label:{
                                    RecipeCard(recipe: recipe)
                                }.tag(recipe)
                                .frame(width: cardAndImageWidth, height: cardHeight)
                                .cornerRadius(cornerRadius)
                        }.padding(4)
                    }
                }
            }.navigationTitle("Explore Recipes")
        }.onAppear{
                viewModel.fetch()
        }.searchable(text: $search_var)
        
        
    }
    private let cardAndImageWidth: CGFloat = 170
    private let cardHeight: CGFloat = 240
    private let imageHeight: CGFloat = 170
    private let cornerRadius: CGFloat = 5
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
