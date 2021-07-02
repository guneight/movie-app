//
//  MovieListPresenter.swift
//  MovieApp
//
//  Created by AlephHV2D on 02/07/21.
//

import Foundation
import Alamofire

final class MovieListPresenter {
    private let view: MovieListViewInterface
    private let interactor: MovieListInteractorInterface
    private let wireframe: MovieListWireframeInterface
    private let genreId: Int
    
    init(genreID: Int, view: MovieListViewInterface, interactor: MovieListInteractorInterface, wireframe: MovieListWireframeInterface) {
        self.genreId = genreID
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
        
    }
}

extension MovieListPresenter: MovieListPresenterInterface {
    func navigate(to option: MovieListNavigationOption) {
        wireframe.navigation(to: option)
    }
    
}
