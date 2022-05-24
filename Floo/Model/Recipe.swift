//
//  Recipe.swift
//  Floo
//
//  Created by Kenny Jinhiro_0706012010024 on 23/05/22.
//

import Foundation
import SwiftUI

struct Recipe: Codable, Hashable {
    let results: [Result]
    let offset, number, totalResults: Int
}

struct Result: Codable, Hashable {
    let id: Int
    let title: String
    let image: String
    let imageType: ImageType
}

enum ImageType: String, Codable, Hashable {
    case jpg = "jpg"
}

//struct Recipe: Hashable,Codable{
//    let name:String
//    let image:String
//}

