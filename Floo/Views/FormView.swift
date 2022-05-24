//
//  FormView.swift
//  Floo
//
//  Created by Kenny Jinhiro_0706012010024 on 24/05/22.
//

import SwiftUI

struct FormView: View {
    @State var name: String = ""
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("General")) {
                    TextField("Name", text: $name)
                    TextField("Description", text: $name)
                    TextField("Nationality/Origin", text: $name)
                }
                Section(header: Text("General")) {
                    TextField("Name", text: $name)
                    TextField("Description", text: $name)
                    TextField("Nationality/Origin", text: $name)
                }
                Section(header: Text("General")) {
                    TextField("Name", text: $name)
                    TextField("Description", text: $name)
                    TextField("Nationality/Origin", text: $name)
                }
            }.navigationTitle("Add Recipes")
        }
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
