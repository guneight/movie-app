//
//  OfficialGenreInterfaces.swift
//  MovieApp
//
//  Created by AlephHV2D on 02/07/21.
//

import Foundation

enum OfficialGenreNavigationOption {
    case movieList
}

protocol OfficialGenreWireframeInterface {
    func navigation(to option: OfficialGenreNavigationOption)
}

protocol OfficialGenreViewInterface: ViewInterface {
    
}

protocol OfficialGenrePresenterInterface: PresenterInterface {
    
}

protocol OfficialGenreInteractorInterface: InteractorInterface {
    
}
