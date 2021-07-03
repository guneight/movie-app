//
//  MovieDetailRemoteRepo.swift
//  MovieApp
//
//  Created by AlephHV2D on 02/07/21.
//

import Foundation
import Alamofire

struct GetMovieDetailConfig: APIConfig {
    var headers: HTTPHeaders = .default()
    var params: Parameters?
    var endpoint: String = Endpoints.Movie.movieDetail.url
    var method: HTTPMethod = .get
    var encoding: ParameterEncoding = JSONEncoding.default
    init(_ params: [String: Any]) {
        self.params = params
    }
}

class MovieDetailRemoteRepo: NSObject {
    @discardableResult
    func getMovieDetail(bodyReq: MovieDetailBodyRequest, completion: @escaping MovieResponse<MovieDetailModel>) -> DataRequest {
        if let dictionary = bodyReq.dictionary {
            return APIService.getObject(setup: GetMovieDetailConfig(dictionary), completion: completion)
        }
        return Alamofire.request("//")
    }
}
