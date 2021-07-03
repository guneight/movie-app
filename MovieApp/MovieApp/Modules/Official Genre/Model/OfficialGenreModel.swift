//
//  OfficialGenreModel.swift
//  MovieApp
//
//  Created by AlephHV2D on 02/07/21.
//

import Foundation
struct OfficialGenreModel: Codable {
    let genres: [Genre]
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name: String
}

// MARK: - GenreBodyRequest
struct OfficialGenreBodyRequest: Encodable {
    let api_key: String?
    let language: String?
}

enum Language: String, Codable {
    case en = "en-US"
}
