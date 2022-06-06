//
//  ProfileViewModel.swift
//  Floo
//
//  Created by Kenny Jinhiro_0706012010024 on 06/06/22.
//

import Foundation

class ProfileViewModel: ObservableObject{
    
    @Published var my_profile: User = User(name: "Kenny Jinhiro", job: "Home Chef", about: "Kenny is a Scottish chef and restaurateur known for his highly acclaimed restaurants and cookbooks but perhaps best known in the early 21st century for the profanity and fiery temper that he freely displayed on television cooking programs.", speciality: ["Dessert and Pastry","Seafood"])
    
    func fetch_profile() {
        let decoder = JSONDecoder()
        if let data = UserDefaults.standard.value(forKey: "my_profile") as? Data {
            let taskData = try? decoder.decode(User.self, from: data)
            my_profile = taskData!
        } else {
            print("Decoder error")
        }
    }
}
