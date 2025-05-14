//
//  HomeView.swift
//  Spotify_Demo
//
//  Created by Duc Canh on 09/08/2024.
//

import SwiftUI
import SwiftfulUI

struct HomeView: View {

    enum DefaultConstants {
        static let heightAvatar: CGFloat = 35
        static let widthAvatar: CGFloat = 35
    }

    @State private var currentUser: User? = nil
    @State private var selectedCategory: Category? = nil
    @State private var products: [Product] = []

    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()

            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(
                    spacing: 1,
                    pinnedViews: [.sectionHeaders],
                    content: {
                        Section {
                            VStack {
                                recentsView
                                
                                if let product = products.first {
                                    newReleaseSection(product)
                                }
                                
                            }
                        .padding(.horizontal, 16)
                    } header: {
                        headerView
                    }

                })
            }
            .clipped()

        }
        .task {
            await getUser()
            await getProduct()
        }
        .toolbar(.hidden, for: .navigationBar)
    }

    private func getUser() async {
        do {
            currentUser = try await DatabaseHelper().getUsers()[1]
        } catch {
            print("zzzzz error")
        }
    }
    
    private func getProduct() async {
        do {
            products = try await Array(DatabaseHelper().getProducts().prefix(8))
        } catch {
            print("Error get product")
        }
    }

    private var headerView: some View {
        HStack(spacing: 8) {

            ZStack {
                if let currentUser = currentUser {
                    ImageLoaderView(urlString: currentUser.image ?? "")

                        .clipShape(Circle())
                        .onTapGesture {

                        }
                }
            }
            .frame(width: DefaultConstants.widthAvatar, height: DefaultConstants.heightAvatar)


            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(Category.allCases, id: \.self) { category in
                        CategoryCell(text: category.rawValue.capitalized,
                                     isSelected: category == selectedCategory)
                        .onTapGesture {
                            self.selectedCategory = category
                        }
                    }
                }

            }

        }
        .padding(.vertical, 24)
    }
    
    private var recentsView: some View {
        NonLazyVGrid(columns: 2, alignment: .center, spacing: 10, items: products) { product in
            if let product {
                RecentsCell(title: product.title ?? "", iconLink: product.firstImage)
            }
        }
    }
    
    private func newReleaseSection(_ product: Product) -> some View {
        NewReleaseCell(
            imageName: product.firstImage,
            headline: product.brand,
            subheadline: product.category,
            title: product.title,
            subtitle: product.description, onAddToPlaylistPressed: {
                
            }, onPlayPressed: {
                
            }
        )
    }
}

#Preview {
    HomeView()
}
