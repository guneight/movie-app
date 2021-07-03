//
//  MovieDetailInterfaces.swift
//  MovieApp
//
//  Created by AlephHV2D on 02/07/21.
//

import Foundation
import Alamofire

enum MovieDetailNavigationOption {
    case review(movieID: Int)
    case playTrailer(movieID: Int)
}

protocol MovieDetailWireframeInterface {
    func navigation(to option: MovieDetailNavigationOption)
}

protocol MovieDetailViewInterface: ViewInterface {
    func reloadData()
}

protocol MovieDetailPresenterInterface: PresenterInterface {
    var movieDetail: MovieDetailModel? { get set }
    func navigation(to option: MovieDetailNavigationOption)
}

protocol MovieDetailInteractorInterface: InteractorInterface {
    @discardableResult
    func getMovieDetail(bodyReq: MovieDetailBodyRequest, completion: @escaping MovieResponse<MovieDetailModel>) -> DataRequest
}
