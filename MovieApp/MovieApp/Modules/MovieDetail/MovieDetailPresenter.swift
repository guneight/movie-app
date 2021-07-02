//
//  MovieDetailPresenter.swift
//  MovieApp
//
//  Created by AlephHV2D on 02/07/21.
//

import Foundation

import Foundation
import Alamofire

final class MovieDetailPresenter {
    private let view: MovieDetailViewInterface
    private let interactor: MovieDetailInteractorInterface
    private let wireframe: MovieDetailWireframeInterface
    private let movieID: Int
    
    init(movieID: Int, view: MovieDetailViewInterface, interactor: MovieDetailInteractorInterface, wireframe: MovieDetailWireframeInterface) {
        self.movieID = movieID
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
        
    }
}

extension MovieDetailPresenter: MovieDetailPresenterInterface {
    
}
