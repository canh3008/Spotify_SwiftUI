//
//  ContentView.swift
//  Spotify_Demo
//
//  Created by Duc Canh on 09/08/2024.
//

import SwiftUI

struct ContentView: View {
    @State var products: [Product] = []
    @State var users: [User] = []

    var body: some View {
        ScrollView(content: {
            VStack(content: {
                ForEach(users) { user in
                    Text(user.lastName ?? "")
                }
//                ForEach(products) { product in
//                    Text(product.title ?? "")
//                }
            })
        })
        .padding()
        .task {
            await getData()
        }
    }

    func getData() async {
        do {
            users = try await DatabaseHelper().getUsers()
            products = try await DatabaseHelper().getProducts()
        } catch {
            print("zzzzz error")
        }
    }
}

#Preview {
    ContentView()
}
