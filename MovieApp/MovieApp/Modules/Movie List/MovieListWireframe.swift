//
//  MovieListWireframe.swift
//  MovieApp
//
//  Created by AlephHV2D on 02/07/21.
//

import Foundation

final class MovieListWireframe: BaseWireframe {
    
    init(genreID: Int) {
        let moduleViewController = MovieListViewController()
        super.init(viewController: moduleViewController)
        let interactor = MovieListInteractor()
        let presenter = MovieListPresenter(genreID: genreID, view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }
    
    private func openMovieDetail(movieID: Int) {
        navigationController?.pushWireframe(MovieDetailWireframe(movieID:  movieID))
    }
}

extension MovieListWireframe: MovieListWireframeInterface {
    func navigation(to option: MovieListNavigationOption) {
        switch option {
        case .movieDetail(movieID: let movieID):
            return openMovieDetail(movieID: movieID)
        }
    }
}
