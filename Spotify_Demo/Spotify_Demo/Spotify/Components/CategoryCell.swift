//
//  CategoryCell.swift
//  Spotify_Demo
//
//  Created by Duc Canh on 09/08/2024.
//

import SwiftUI

struct CategoryCell: View {
    var text: String = "text"
    var isSelected: Bool = true
    var body: some View {
        Text(text)
            .foregroundStyle(isSelected ? .spotifyBlack : .spotifyWhite)
            .frame(minWidth: 35)
            .padding(8)
            .padding(.horizontal, 10)
            .background(isSelected ? .spotifyGreen : .spotifyDarkGray)
            .clipShape(Capsule(style: .continuous))
    }
}

#Preview {
    CategoryCell()
}
