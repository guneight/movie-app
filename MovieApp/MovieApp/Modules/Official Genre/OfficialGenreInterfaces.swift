//
//  OfficialGenreInterfaces.swift
//  MovieApp
//
//  Created by AlephHV2D on 02/07/21.
//

import Foundation
import Alamofire

enum OfficialGenreNavigationOption {
    case movieList(genre: String)
}

protocol OfficialGenreWireframeInterface {
    func navigation(to option: OfficialGenreNavigationOption)
}

protocol OfficialGenreViewInterface: ViewInterface {
    func reloadData()
}

protocol OfficialGenrePresenterInterface: PresenterInterface {
    var genre: OfficialGenreModel? { get set }
    func navigate(to option: OfficialGenreNavigationOption)
}

protocol OfficialGenreInteractorInterface: InteractorInterface {
    @discardableResult
    func getOfficialGenre(bodyReq: OfficialGenreBodyRequest, completion: @escaping MovieResponse<OfficialGenreModel>) -> DataRequest
}
