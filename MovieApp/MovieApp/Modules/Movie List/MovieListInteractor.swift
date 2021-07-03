//
//  MovieListInteractor.swift
//  MovieApp
//
//  Created by AlephHV2D on 02/07/21.
//

import Foundation
import Alamofire

final class MovieListInteractor {
    private let _remoteRepo = MovieListRemoteRepo()
}

extension MovieListInteractor: MovieListInteractorInterface {
    func getMovieList(bodyReq: MovieListBodyRequest, completion: @escaping MovieResponse<MovieListModel>) -> DataRequest {
        return _remoteRepo.getMovieList(bodyReq: bodyReq, completion: completion)
    }
    
}
