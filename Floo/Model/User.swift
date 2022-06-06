//
//  User.swift
//  Floo
//
//  Created by Kenny Jinhiro_0706012010024 on 06/06/22.
//

import Foundation

struct User: Codable, Hashable{
    var name: String
    var job: String
    var about: String
    var speciality: [String]
}
