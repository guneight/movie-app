//
//  MovieReviewsRemoteRepo.swift
//  MovieApp
//
//  Created by AlephHV2D on 03/07/21.
//

import Foundation

import Foundation
import Alamofire

struct GetMovieReviewConfig: APIConfig {
    var headers: HTTPHeaders = .default()
    var params: Parameters?
    var endpoint: String = Endpoints.Movie.review.url
    var method: HTTPMethod = .get
    var encoding: ParameterEncoding = JSONEncoding.default
    init(_ params: [String: Any]) {
        self.params = params
    }
}

class MovieReviewRemoteRepo: NSObject {
    @discardableResult
    func getMovieReview(bodyReq: MovieReviewsBodyRequest, completion: @escaping MovieResponse<MovieReviewModel>) -> DataRequest {
        if let dictionary = bodyReq.dictionary {
            return APIService.getObject(setup: GetMovieReviewConfig(dictionary), completion: completion)
        }
        return Alamofire.request("//")
    }
}
