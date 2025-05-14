//
//  NewReleaseCell.swift
//  Spotify_Demo
//
//  Created by Canh Tran on 12/5/25.
//

import SwiftUI

struct NewReleaseCell: View {
    
    let imageName: String
    let headline: String?
    let subheadline: String?
    let title: String?
    let subtitle: String?
    var onAddToPlaylistPressed: (() -> Void)?
    var onPlayPressed: (() -> Void)?
    
    var body: some View {
        VStack {
            HStack {
                ImageLoaderView(urlString: imageName, resizeMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    if let headline {
                        Text(headline)
                            .font(.headline)
                            .foregroundStyle(.spotifyWhite)
                            .fontWeight(.bold)
                    }
                    if let subheadline {
                        Text(subheadline)
                            .font(.caption)
                            .foregroundStyle(.spotifyLightGray)
                    }
                }
                    
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
             HStack {
                ImageLoaderView(urlString: imageName, resizeMode: .fill)
                    .frame(width: 140)
                
                 VStack(alignment: .leading, spacing: 5) {
                     if let title {
                         Text(title)
                             .font(.callout)
                             .foregroundStyle(.spotifyWhite)
                     }
                    
                     if let subtitle {
                         Text(subtitle)
                             .font(.caption)
                             .foregroundStyle(.spotifyLightGray)
                     }
                    
                    HStack {
                        Image(systemName: "plus.circle")
                            .foregroundStyle(.spotifyLightGray)
                            .font(.title3)
                            .onTapGesture {
                                onAddToPlaylistPressed?()
                            }
                        Spacer()
                         Image(systemName: "play.circle")
                            .foregroundStyle(.spotifyLightGray)
                            .font(.title3)

                    }
                }
                .padding(.trailing, 16)
            }
             .frame(maxWidth: .infinity, maxHeight: 140, alignment: .leading)
            .themeColors(isSelected: false)
            .cornerRadius(10)
            .onTapGesture {
                onPlayPressed?()
            }
        }
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        NewReleaseCell(
            imageName: Constants.randomImage,
            headline: "Headline",
            subheadline: "Subheadline",
            title: "title",
            subtitle: "subtitle"
        )
    }
    
}
