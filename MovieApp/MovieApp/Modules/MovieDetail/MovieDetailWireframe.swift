//
//  MovieDetailWireframe.swift
//  MovieApp
//
//  Created by AlephHV2D on 02/07/21.
//

import Foundation
final class MovieDetailWireframe: BaseWireframe {
    
    init(movieID: Int) {
        let moduleViewController = MovieDetailViewController()
        super.init(viewController: moduleViewController)
        let interactor = MovieDetailInteractor()
        let presenter = MovieDetailPresenter(movieID: movieID, view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }
    
    private func _openMovieReview(movieID: Int) {
        navigationController?.pushWireframe(MovieReviewWireframe.init(movieID: movieID))
    }
    
    private func _playTrailer(movieID: Int) {
        
    }
}

extension MovieDetailWireframe: MovieDetailWireframeInterface {
    func navigation(to option: MovieDetailNavigationOption) {
        switch option {
        case .review(movieID: let movieID):
            return _openMovieReview(movieID: movieID)
        case .playTrailer(movieID: let movieID):
            return _playTrailer(movieID: movieID)
        }
    }
}
