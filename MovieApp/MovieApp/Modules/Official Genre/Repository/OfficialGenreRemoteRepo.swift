//
//  OfficialGenreRemoteRepo.swift
//  MovieApp
//
//  Created by AlephHV2D on 02/07/21.
//

import Foundation
import Alamofire

struct GetOfficialGenreConfig: APIConfig {
    var headers: HTTPHeaders = .default()
    
    var params: Parameters?
    var endpoint: String = Endpoints.Movie.officialGenre.url
    var method: HTTPMethod = .get
    var encoding: ParameterEncoding = JSONEncoding.default
    init(_ params: [String: Any]) {
        self.params = params
    }
}

class OfficialGenreRemoteRepo: NSObject {
    @discardableResult
    func getOfficialGenre(bodyReq: OfficialGenreBodyRequest, completion: @escaping MovieResponse<OfficialGenreModel>) -> DataRequest {
        if let dictionary = bodyReq.dictionary {
            return APIService.getObject(setup: GetOfficialGenreConfig(dictionary), completion: completion)
        }
        return Alamofire.request("//")
    }
}
