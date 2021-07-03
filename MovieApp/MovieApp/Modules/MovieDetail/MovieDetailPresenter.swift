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
    var movieDetail: MovieDetailModel? {
        didSet {
            view.reloadData()
        }
    }
    
    init(movieID: Int, view: MovieDetailViewInterface, interactor: MovieDetailInteractorInterface, wireframe: MovieDetailWireframeInterface) {
        self.movieID = movieID
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
        
    }
    
    private func _handleResultMovieDetail(_ response: ResponseObject<MovieDetailModel>?, _ error: Error?) {
        if let responseData = response {
            switch responseData.handleResult() {
            case .success(let data):
                self.movieDetail = data
            case .failure(let err):
                print(err)
            }
        }
    }
    
    private func _getMovieDetail() {
        let bodyReq = MovieDetailBodyRequest(api_key: API_KEY, language: Language.en.rawValue)
        self.interactor.getMovieDetail(bodyReq: bodyReq) { [weak self] (response, error) in
            guard let self = self else { return }
            self._handleResultMovieDetail(response, error)
        }
    }
}

extension MovieDetailPresenter: MovieDetailPresenterInterface {
    func navigation(to option: MovieDetailNavigationOption) {
        wireframe.navigation(to: option)
    }
}
