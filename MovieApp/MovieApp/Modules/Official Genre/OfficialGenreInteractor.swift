//
//  OfficialGenreInteractor.swift
//  MovieApp
//
//  Created by AlephHV2D on 02/07/21.
//

import Foundation
import Alamofire

final class OfficialGenreInteractor {
    private let _remoteRepo = OfficialGenreRemoteRepo()
}

extension OfficialGenreInteractor: OfficialGenreInteractorInterface {
    func getOfficialGenre(bodyReq: OfficialGenreBodyRequest, completion: @escaping MovieResponse<OfficialGenreModel>) -> DataRequest {
        return _remoteRepo.getOfficialGenre(bodyReq: bodyReq, completion: completion)
    }
}
