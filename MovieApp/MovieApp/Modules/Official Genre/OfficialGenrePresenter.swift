//
//  OfficialGenrePresenter.swift
//  MovieApp
//
//  Created by AlephHV2D on 02/07/21.
//

import Foundation
import Alamofire

final class OfficialGenrePresenter {
    private let view: OfficialGenreViewInterface
    private let interactor: OfficialGenreInteractorInterface
    private let wireframe: OfficialGenreWireframeInterface
    
    var genre: OfficialGenreModel? {
        didSet {
            view.reloadData()
        }
    }
    init(view: OfficialGenreViewInterface, interactor: OfficialGenreInteractorInterface, wireframe: OfficialGenreWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
    
    private func _handleResultOfficialGenre(_ response: ResponseObject<OfficialGenreModel>?, _ error: Error?) {
        if let responseData = response {
            switch responseData.handleResult() {
            case .success(let data):
                self.genre = data
            case .failure(let err):
                print(err)
            }
        }
    }
    
    private func _getOfficialGenre() {
        let bodyReq = OfficialGenreBodyRequest(api_key: API_KEY, language: Language.en.rawValue)
        self.interactor.getOfficialGenre(bodyReq: bodyReq) { [weak self] (response, error) in
            guard let self = self else { return }
            self._handleResultOfficialGenre(response, error)
        }
    }
}

extension OfficialGenrePresenter: OfficialGenrePresenterInterface {
    func viewDidLoad() {
        _getOfficialGenre()
    }
    
    func navigate(to option: OfficialGenreNavigationOption) {
        wireframe.navigation(to: option)
    }
    
}
