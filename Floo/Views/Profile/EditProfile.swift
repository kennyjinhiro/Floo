//
//  AddRecipeView.swift
//  Floo
//
//  Created by MacBook Pro on 08/05/2022.
//

import SwiftUI

struct EditProfile: View {
//    @State private var name:String = ""
    @Binding var user: User 
    @Environment(\.presentationMode) private var presentationMode
    @State private var instructions: [String] = [""]
    
    @State private var viewModel = ProfileViewModel()
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading){
                    Group{
                    Text("General")
                        .font(.title2)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .padding(.top)
                        Text("Name").fontWeight(.bold).padding(.top,12)
                        TextField("Name", text:$user.name )
                    Divider()
                        Text("Job").fontWeight(.bold).padding(.top,12)
                        TextField("Job", text: $user.job)
                    Divider()
                    }
                    Group{
                        Text("Details")
                            .font(.title2)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .padding(.top, 24)
                        Text("About").fontWeight(.bold).padding(.top, 24)
                        TextField("About", text: $user.job)
                        Divider()
                        Text("Specialities").fontWeight(.bold).padding(.top, 24)
                        ForEach(0..<$user.speciality.count, id: \.self) { idx in
                            TextField("Speciality \(idx + 1)", text: $user.speciality[idx])
                            Divider()
                        }
                        Button {
                            user.speciality.append("")
                        } label: {
                            HStack{
                                Spacer()
                                Text("Add More Specialities").fontWeight(.bold).foregroundColor(Color.white)
                                Spacer()
                            }
                        }.padding(.all, 16).background(Color.blue).frame(height: 42, alignment: .center).cornerRadius(8.0).padding(.bottom, 24)
                            .padding(.top, 12)
                    }
                    Button {
                        editUser(sentUser: user)
                            self.presentationMode.wrappedValue.dismiss()
                        }label:{
                            HStack{
                                Spacer()
                                Text("Edit Profile").fontWeight(.bold).foregroundColor(.white)
                                Spacer()
                            }
                        }.padding(.all, 16).background(Color.blue).frame(height: 42, alignment: .center).cornerRadius(8.0).padding(.bottom, 24)
                            .padding(.top, 12)
                            
                    }
                    
                }.navigationTitle("Edit User")
                .padding().onAppear{
                    viewModel.fetch_profile()
                }
        }
    }
}
func editUser(sentUser:User){
    var retrievedUser: User = User(name: "Kenny Jinhiro", job: "Home Chef", about: "Kenny is a Scottish chef and restaurateur known for his highly acclaimed restaurants and cookbooks but perhaps best known in the early 21st century for the profanity and fiery temper that he freely displayed on television cooking programs.", speciality: ["Dessert and Pastry","Seafood"])
    let decoder = JSONDecoder()
    if let data = UserDefaults.standard.value(forKey: "my_profile") as? Data {
        let taskData = try? decoder.decode(User.self, from: data)
        retrievedUser = taskData!
    }
    retrievedUser = sentUser
    let encoder = JSONEncoder()
    if let encoded = try? encoder.encode(retrievedUser) {
        UserDefaults.standard.set(encoded, forKey: "my_profile")
    }
}
//struct EditProfile_Previews: PreviewProvider {
//    static var viewModel = ProfileViewModel()
//    static var previews: some View {
//        EditProfile(user: viewModel.my_profile).environmentObject(ProfileViewModel())
//    }
//}
