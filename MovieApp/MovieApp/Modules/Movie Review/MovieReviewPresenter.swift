//
//  MovieReviewPresenter.swift
//  MovieApp
//
//  Created by AlephHV2D on 02/07/21.
//

import Foundation

final class MovieReviewPresenter {
    private let view: MovieReviewViewInterface
    private let interactor: MovieReviewInteractorInterface
    private let wireframe: MovieReviewWireframeInterface
    private let movieID: Int
    
    init(movieID: Int, view: MovieReviewViewInterface, interactor: MovieReviewInteractorInterface, wireframe: MovieReviewWireframeInterface) {
        self.movieID = movieID
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
        
    }
}

extension MovieReviewPresenter: MovieReviewPresenterInterface {
    
}
