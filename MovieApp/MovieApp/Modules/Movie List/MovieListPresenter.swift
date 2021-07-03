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
    private let genre: String
    
    var movieList: MovieListModel? {
        didSet {
            view.relaodData()
        }
    }
    
    init(genre: String, view: MovieListViewInterface, interactor: MovieListInteractorInterface, wireframe: MovieListWireframeInterface) {
        self.genre = genre
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
        
    }
    private func _handleResultMovieList(_ response: ResponseObject<MovieListModel>?, _ error: Error?) {
        if let responseData = response {
            switch responseData.handleResult() {
            case .success(let data):
                self.movieList = data
            case .failure(let err):
                print(err)
            }
        }
    }
    
    private func _getMovieList() {
        let bodyReq = MovieListBodyRequest(api_key: API_KEY, language: Language.en.rawValue, pages: 10000, with_genre: genre)
        self.interactor.getMovieList(bodyReq: bodyReq) { [weak self] (response, error) in
            guard let self = self else { return }
            self._handleResultMovieList(response, error)
        }
    }
}

extension MovieListPresenter: MovieListPresenterInterface {
    func navigate(to option: MovieListNavigationOption) {
        wireframe.navigation(to: option)
    }
    
    func viewDidLoad() {
        _getMovieList()
    }
}
