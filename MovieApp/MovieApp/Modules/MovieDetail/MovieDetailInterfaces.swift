//
//  MovieDetailInterfaces.swift
//  MovieApp
//
//  Created by AlephHV2D on 02/07/21.
//

import Foundation

import Foundation

enum MovieDetailNavigationOption {
    case review(movieID: Int)
    case playTrailer(movieID: Int)
}

protocol MovieDetailWireframeInterface {
    func navigation(to option: MovieDetailNavigationOption)
}

protocol MovieDetailViewInterface: ViewInterface {
    
}

protocol MovieDetailPresenterInterface: PresenterInterface {
    func navigation(to option: MovieDetailNavigationOption)
}

protocol MovieDetailInteractorInterface: InteractorInterface {
    
}
