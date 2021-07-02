//
//  MovieListInterfaces.swift
//  MovieApp
//
//  Created by AlephHV2D on 02/07/21.
//

import Foundation

enum MovieListNavigationOption {
    case movieDetail
}

protocol MovieListWireframeInterface {
    func navigation(to option: MovieListNavigationOption)
}

protocol MovieListViewInterface: ViewInterface {
    
}

protocol MovieListPresenterInterface: PresenterInterface {
    
}

protocol MovieListInteractorInterface: InteractorInterface {
    
}
