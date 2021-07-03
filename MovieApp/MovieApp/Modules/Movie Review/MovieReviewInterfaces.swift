//
//  MovieReviewInterfaces.swift
//  MovieApp
//
//  Created by AlephHV2D on 02/07/21.
//

import Foundation
import Alamofire

protocol MovieReviewWireframeInterface {
}

protocol MovieReviewViewInterface: ViewInterface {
    func reloadData()
}

protocol MovieReviewPresenterInterface: PresenterInterface {
    var movieReview: MovieReviewModel? { get set }
}

protocol MovieReviewInteractorInterface: InteractorInterface {
    @discardableResult
    func getMovieReview(bodyReq: MovieReviewsBodyRequest, completion: @escaping MovieResponse<MovieReviewModel>) -> DataRequest
}
