//
//  MovieListInterfaces.swift
//  MovieApp
//
//  Created by AlephHV2D on 02/07/21.
//

import Foundation
import Alamofire

enum MovieListNavigationOption {
    case movieDetail(movieID: Int)
}

protocol MovieListWireframeInterface {
    func navigation(to option: MovieListNavigationOption)
}

protocol MovieListViewInterface: ViewInterface {
    func relaodData()
}

protocol MovieListPresenterInterface: PresenterInterface {
    var movieList: MovieListModel? { get set }
    func navigate(to option: MovieListNavigationOption)
}

protocol MovieListInteractorInterface: InteractorInterface {
    @discardableResult
    func getMovieList(bodyReq: MovieListBodyRequest, completion: @escaping MovieResponse<MovieListModel>) -> DataRequest
}
