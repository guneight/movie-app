//
//  MovieListRemoteRepo.swift
//  MovieApp
//
//  Created by AlephHV2D on 02/07/21.
//

import Foundation
import Alamofire

struct GetMovieListConfig: APIConfig {
    var headers: HTTPHeaders = .default()
    
    var params: Parameters?
    var endpoint: String = Endpoints.Movie.movieList.url
    var method: HTTPMethod = .get
    var encoding: ParameterEncoding = JSONEncoding.default
    init(_ params: [String: Any]) {
        self.params = params
    }
}

class MovieListRemoteRepo: NSObject {
    @discardableResult
    func getMovieList(bodyReq: MovieListBodyRequest, completion: @escaping MovieResponse<MovieListModel>) -> DataRequest {
        if let dictionary = bodyReq.dictionary {
            return APIService.getObject(setup: GetMovieListConfig(dictionary), completion: completion)
        }
        return Alamofire.request("//")
    }
}
