//
//  URLImage.swift
//  Floo
//
//  Created by Kenny Jinhiro_0706012010024 on 01/06/22.
//

import SwiftUI

struct URLImage: View{
    let url_image:String
    let cardAndImageWidth: CGFloat
    let cardHeight: CGFloat
    let imageHeight: CGFloat
    let cornerRadius: CGFloat
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
}
