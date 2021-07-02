//
//  OfficialGenreModel.swift
//  MovieApp
//
//  Created by AlephHV2D on 02/07/21.
//

import Foundation

struct OfficialGenreModel: Codable {
    let id: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}



