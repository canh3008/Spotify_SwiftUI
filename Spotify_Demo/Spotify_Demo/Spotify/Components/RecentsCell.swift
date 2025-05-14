//
//  RecentsCell.swift
//  Spotify_Demo
//
//  Created by Canh Tran on 11/5/25.
//

import SwiftUI

struct RecentsCell: View {
    let title: String
    let iconLink: String
    
    var body: some View {
        HStack(spacing: 16) {
            ImageLoaderView(urlString: iconLink, resizeMode: .fill)
                .frame(width: 55, height: 55)
                
            Text(title)
                .padding(.trailing, 16)
                .foregroundStyle(.white)
                .lineLimit(2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .themeColors(isSelected: false)
        .cornerRadius(10)
        
    }
}

#Preview {
    VStack {
        HStack {
            RecentsCell(title: "Hello", iconLink: Constants.randomImage)
            RecentsCell(title: "Hello", iconLink: Constants.randomImage)
        }
        
        HStack {
            RecentsCell(title: "Hello", iconLink: Constants.randomImage)
            RecentsCell(title: "Hello", iconLink: Constants.randomImage)
        }
    }
}
