//
//  MovieListInterfaces.swift
//  MovieApp
//
//  Created by AlephHV2D on 02/07/21.
//

import Foundation

enum MovieListNavigationOption {
    case movieDetail(movieID: Int)
}

protocol MovieListWireframeInterface {
    func navigation(to option: MovieListNavigationOption)
}

protocol MovieListViewInterface: ViewInterface {
    
}

protocol MovieListPresenterInterface: PresenterInterface {
    func navigate(to option: MovieListNavigationOption)
}

protocol MovieListInteractorInterface: InteractorInterface {
    
}
