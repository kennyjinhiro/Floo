//
//  ProfileView.swift
//  Floo
//
//  Created by Kenny Jinhiro_0706012010024 on 06/06/22.
//

import SwiftUI

struct ProfileView: View {
    @State var picker_select = 0
    let columns = [GridItem(),
                   GridItem()]
    private let cardAndImageWidth: CGFloat = 110
    private let cardHeight: CGFloat = 160
    private let imageHeight: CGFloat = 110
    private let cornerRadius: CGFloat = 5
    @StateObject var viewModel = MyRecipeViewModel()
    @StateObject var profileViewModel = ProfileViewModel()
    var body: some View {
        NavigationView{
        ZStack{
            Spacer()
            AsyncImage(url: URL(string:"https://foodtank.com/wp-content/uploads/2022/05/Food-As-Medicine-Featured.jpg" ?? "")) { image in
                image.resizable()
                    .scaledToFill()
                    .shadow(radius: 8)
                    .opacity(0.6)
                    .brightness(-0.5)
                    .tint(.black)
            }placeholder: {
                ProgressView()
            }
            VStack(alignment: .center){
                Group{
                AsyncImage(url: URL(string:"https://as1.ftcdn.net/v2/jpg/02/22/85/16/1000_F_222851624_jfoMGbJxwRi5AWGdPgXKSABMnzCQo9RN.jpg" ?? "")) { image in
                    image.resizable()
                        .scaledToFill()
                        .shadow(radius: 8)
                }placeholder: {
                    ProgressView()
                }.frame(width: 180, height: 180)
                    .background(Color.gray)
                    .clipShape(Circle())
                Text("\(profileViewModel.my_profile.name)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Text("\(profileViewModel.my_profile.job)")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(.top, -64)
                }.padding(.top, 48)
                NavigationLink{
                    EditProfile(user: $profileViewModel.my_profile)
                }label:{
                    HStack(alignment: .center){
                        Spacer()
                        Text("Edit Profile").fontWeight(.bold).foregroundColor(.white)
                        Spacer()
                    }
                }.padding(.all, 16).background(Color.blue).frame(height: 42, alignment: .center).cornerRadius(8.0).padding(.bottom, 24)
                ZStack{
                    Color(.white).cornerRadius(radius: 20.0, corners: [.topLeft, .topRight])
                    ZStack{
                        VStack{
                            Picker(selection: $picker_select, label: Text(""), content: {
                                Text("Chef Info").tag(0)
                                Text("\(viewModel.my_recipes.count) Recipes").tag(1)
                            }).pickerStyle(SegmentedPickerStyle()).frame(width: 280).padding(.top, 24)
                            ScrollView{
                                //Chef Info
                                VStack(alignment: .leading){
                                    if (picker_select == 0){
                                        HStack{
                                        Text("About").fontWeight(.bold).multilineTextAlignment(.leading).padding().font(.title2)
                                        Spacer()
                                        }
                                        HStack{
                                            Text("\(profileViewModel.my_profile.about)")
                                                .padding(.leading, 16)
                                        }
                                        HStack{
                                        Text("Speciality").fontWeight(.bold).multilineTextAlignment(.leading).padding().font(.title2)
                                        Spacer()
                                        }
                                        ForEach(0..<profileViewModel.my_profile.speciality.count, id: \.self) { idx in
                                        HStack{
                                            Text("\(profileViewModel.my_profile.speciality[idx])")
                                                .padding(.leading, 16)
                                        }
                                        }}else{
                                        LazyVGrid(columns: columns) {
                                            ForEach(viewModel.my_recipes, id: \.self){ recipe in
                                                ZStack {
                                                    RoundedRectangle(cornerRadius: cornerRadius)
                                                        .strokeBorder(SwiftUI.Color.white, lineWidth: 2)
                                                        .frame(width: cardAndImageWidth, height: cardHeight)
                                                        .background(SwiftUI.Color.white)
                                                    NavigationLink{
                                                        MyRecipeDetail(recipe: recipe)
                                                    } label:{
                                                        ProfileRecipeCard(recipe: recipe)
                                                    }.tag(recipe)
                                                    .frame(width: cardAndImageWidth, height: cardHeight)
                                                    .cornerRadius(cornerRadius)
                                                }.padding(4)
                                                }
                                        }.padding(.top, 4)
                                        }
                                }.frame(width: 300)
                                //Recipe
                                
    
                                }
                            }
                        }
                    }
                }.frame(width: 360)
            }.onAppear{
                profileViewModel.fetch_profile()
                viewModel.fetch_saved_recipes()
        }.padding(.top, -150)
    }
}
}



struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

extension View {
    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}

struct ProfileCard: View {
    var recipe: DetailedRecipe
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: recipe.image ?? ""))
                .frame(width: 170, height: 170).cornerRadius(5)
            Text(recipe.title ?? "")
                .multilineTextAlignment(.center)
                .lineLimit(4).font(.system(size: 14, weight: .bold))
                .padding(.bottom,48.00)
                .frame(width: 170, height: 90)
            
        }.frame(width: 170, height: 260)
    }
}

struct CornerRadiusStyle: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner

    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}

struct CornerRadiusShape: Shape {
    var radius = CGFloat.infinity
    var corners = UIRectCorner.allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
