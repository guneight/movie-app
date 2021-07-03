//
//  MovieReviewInteractor.swift
//  MovieApp
//
//  Created by AlephHV2D on 02/07/21.
//

import Foundation
import Alamofire

final class MovieReviewInteractor {
    private let _remoteRepo = MovieReviewRemoteRepo()
}

extension MovieReviewInteractor: MovieReviewInteractorInterface {
    func getMovieReview(bodyReq: MovieReviewsBodyRequest, completion: @escaping MovieResponse<MovieReviewModel>) -> DataRequest {
        return _remoteRepo.getMovieReview(bodyReq: bodyReq, completion: completion)
    }
    
}
