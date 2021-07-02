//
//  MovieReviewWireframe.swift
//  MovieApp
//
//  Created by AlephHV2D on 02/07/21.
//

import Foundation
final class MovieReviewWireframe: BaseWireframe {
    
    init(movieID: Int) {
        let moduleViewController = MovieReviewViewController()
        super.init(viewController: moduleViewController)
        let interactor = MovieReviewInteractor()
        let presenter = MovieReviewPresenter(movieID: movieID, view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }
}

extension MovieReviewWireframe: MovieReviewWireframeInterface {
}
