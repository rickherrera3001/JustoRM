//
//  JustoView.swift
//  Justo RM
//
//  Created by Ricardo Developer on 17/04/24.
//

import Foundation
import SwiftUI

struct ContentJustoView: View {
   
    let profiles: [Results] = [
        Results(gender: "female", name: Name(title: "Ms", first: "Alice", last: "Johnson"), location: nil, email: "alice@example.com", login: Login(uuid: "123", username: "alice123", password: "password", salt: "salt", md5: "md5", sha1: "sha1", sha256: "sha256"), dob: Dob(date: "1990-05-20", age: 31), registered: Dob(date: "2022-01-01", age: 2), phone: "123-456-7890", cell: "987-654-3210", id: ID(name: "SSN", value: "123-45-6789"), picture: Picture(large: "large_url", medium: "medium_url", thumbnail: "thumbnail_url"), nat: "US")
        
    ]

    var body: some View {
        NavigationView {
            List(profiles, id: \.email) { profile in
                NavigationLink(destination: ProfileDetailView(profile: profile)) {
                    ProfileRow(profile: profile)
                }
            }
            .navigationTitle("Perfiles")
        }
    }
}

struct ProfileRow: View {
    let profile: Results

    var body: some View {
        HStack {
            Image("alice")
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text("\(profile.name.first) \(profile.name.last)")
                    .font(.headline)
                Text(profile.email)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding(8)
    }
}

struct ProfileDetailView: View {
    let profile: Results

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Nombre: \(profile.name.title) \(profile.name.first) \(profile.name.last)")
                .font(.title)
            Text("Género: \(profile.gender)")
                .font(.headline)
            Text("Fecha de nacimiento: \(profile.dob.date)")
                .font(.headline)
            Text("Teléfono: \(profile.phone)")
                .font(.headline)
            
            Spacer()
        }
        .padding()
        .navigationBarTitle("\(profile.name.first) \(profile.name.last)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
