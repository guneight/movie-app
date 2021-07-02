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
    
    init(view: OfficialGenreViewInterface, interactor: OfficialGenreInteractorInterface, wireframe: OfficialGenreWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

extension OfficialGenrePresenter: OfficialGenrePresenterInterface {
    
}
