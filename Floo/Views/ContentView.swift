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
                .resizable().aspectRatio(contentMode: .fill).frame(width: 150, height: 150).background(Color.gray)
        }else{
            Image(systemName: "None")
                .resizable().aspectRatio(contentMode: .fit).frame(width: 150, height: 150).background(Color.gray).onAppear{
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
                    ForEach(viewModel.results, id: \.self){ recipe in VStack{
                        URLImage(url_image: recipe.image)
                            .padding(3)
                        Text(recipe.title)
                            .font(.body)
                            .multilineTextAlignment(.leading)
                            
                        }
                    }.padding(10)
                }
            }.navigationTitle("Explore Recipes")
        }.onAppear{
                viewModel.fetch()
        }.searchable(text: $search_var)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
