//
//  EndPoints.swift
//  MovieApp
//
//  Created by AlephHV2D on 02/07/21.
//

import Foundation

import Foundation
import UIKit

struct API {
    static let baseUrl = "https://api.themoviedb.org/3"
}

protocol Endpoint {
    var path: String { get }
    var url: String { get }
}

enum Endpoints {
    enum Movie: Endpoint {
        case officialGenre
        case movieList
        case movieDetail
        case review
        case playTrailer

        public var path: String {
            switch self {
            case .officialGenre:
                return "/genre/movie/list"
            case .movieList:
                return "/discover/movie"
            case .movieDetail:
                return "/movie/{movie_id}"
            case .review:
                return "/movie/{movie_id}/reviews"
            case .playTrailer:
                return "/movie/{movie_id}/videos"
            }
        }

        public var url: String {
            return "\(API.baseUrl)\(path)"
        }
    }
}
    
  
