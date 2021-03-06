//
//  OfficialGenreWireframe.swift
//  MovieApp
//
//  Created by AlephHV2D on 02/07/21.
//

import UIKit

final class OfficialGenreWireframe: BaseWireframe {
    private let storyboard = UIStoryboard(name: "OfficialGenre", bundle: nil)
    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: OfficialGenreViewController.self)
        super.init(viewController: moduleViewController)
        let interactor = OfficialGenreInteractor()
        let presenter = OfficialGenrePresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }
    
    private func openMovieList(genre: String) {
        navigationController?.pushWireframe(MovieListWireframe(genre: genre))
    }
}

extension OfficialGenreWireframe: OfficialGenreWireframeInterface {
    func navigation(to option: OfficialGenreNavigationOption) {
        switch option {
        case .movieList(genre: let genre):
            return openMovieList(genre: genre)
        }
    }
}
