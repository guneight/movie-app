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
    var movieReview: MovieReviewModel? {
        didSet {
            view.reloadData()
        }
    }
    
    init(movieID: Int, view: MovieReviewViewInterface, interactor: MovieReviewInteractorInterface, wireframe: MovieReviewWireframeInterface) {
        self.movieID = movieID
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
        
    }
    
    private func _handleResultMovieReview(_ response: ResponseObject<MovieReviewModel>?, _ error: Error?) {
        if let responseData = response {
            switch responseData.handleResult() {
            case .success(let data):
                self.movieReview = data
            case .failure(let err):
                print(err)
            }
        }
    }
    
    private func _getMovieReview() {
        let bodyReq = MovieReviewsBodyRequest(api_key: API_KEY, language: Language.en.rawValue, page: 10000)
        self.interactor.getMovieReview(bodyReq: bodyReq) { [weak self] (response, error) in
            guard let self = self else { return }
            self._handleResultMovieReview(response, error)
        }
    }
}

extension MovieReviewPresenter: MovieReviewPresenterInterface {
    
}
