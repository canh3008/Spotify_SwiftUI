//
//  User.swift
//  Spotify_Demo
//
//  Created by Duc Canh on 09/08/2024.
//

import Foundation

// MARK: - UserArray
struct UserArray: Codable {
    let users: [User]?
    let total, skip, limit: Int?
}

// MARK: - User
struct User: Codable, Identifiable {
    let id: Int?
    let firstName, lastName, maidenName: String?
    let age: Int?
    let email, phone, username, password: String?
    let birthDate: String?
    let image: String?
}
