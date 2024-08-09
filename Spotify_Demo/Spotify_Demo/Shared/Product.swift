//
//  Product.swift
//  Spotify_Demo
//
//  Created by Duc Canh on 09/08/2024.
//

import Foundation

// MARK: - ProductArray
struct ProductArray: Codable {
    let products: [Product]?
    let total, skip, limit: Int?
}

// MARK: - Product
struct Product: Codable, Identifiable {
    let id: Int?
    let title, description: String?
    let category: String?
    let price, discountPercentage, rating: Double?
    let stock: Int?
    let tags: [String]?
    let brand, sku: String?
    let images: [String]?
    let thumbnail: String?
}
