//
//  HomeView.swift
//  Spotify_Demo
//
//  Created by Duc Canh on 09/08/2024.
//

import SwiftUI

struct HomeView: View {

    enum DefaultConstants {
        static let heightAvatar: CGFloat = 35
        static let widthAvatar: CGFloat = 35
    }

    @State private var currentUser: User? = nil
    @State private var selectedCategory: Category? = nil

    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()

            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 1, pinnedViews: [.sectionHeaders], content: {
                    Section {
                        ForEach(1..<10) { index in
                            Rectangle()
                                .fill(.red)
                                .frame(width: 300, height: 300)
                        }
                    } header: {
                        headerView
                    }

                })
            }
            .clipped()

        }
        .task {
            await getUser()
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
}

#Preview {
    HomeView()
}
