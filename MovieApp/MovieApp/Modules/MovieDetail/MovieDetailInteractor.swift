//
//  MovieDetailInteractor.swift
//  MovieApp
//
//  Created by AlephHV2D on 02/07/21.
//

import Foundation
import Alamofire

final class MovieDetailInteractor {
    private let _remoteRepo = MovieDetailRemoteRepo()
}

extension MovieDetailInteractor: MovieDetailInteractorInterface {
    func getMovieDetail(bodyReq: MovieDetailBodyRequest, completion: @escaping MovieResponse<MovieDetailModel>) -> DataRequest {
        return _remoteRepo.getMovieDetail(bodyReq: bodyReq, completion: completion)
    }
    
}
