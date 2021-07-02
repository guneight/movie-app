//
//  MovieNavigationController.swift
//  MovieApp
//
//  Created by AlephHV2D on 01/07/21.
//

import UIKit

public enum NavigationBarColor {
    case white
    case blue
}

class MovieNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationBarHidden = true
        navigationBar.titleTextAttributes = [NSAttributedString.Key.font: MovieFont.H1]
        // Hide border from the navigation bar
        navigationBar.shadowImage = UIImage()
        setNavigationBarColor(.blue)
    }
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        let backImage = MovieImage().getImage(.backIcon)?.withRenderingMode(.alwaysTemplate)
        let backBarButtonItem = UIBarButtonItem(image: backImage, style: .plain, target: self, action: #selector(back(_:)))
        backBarButtonItem.title = ""
        viewController.navigationItem.leftBarButtonItem = backBarButtonItem
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if let topViewController = viewControllers.last {
            if let topViewController = topViewController as? UITabBarController {
                return topViewController.selectedViewController?.preferredStatusBarStyle ?? .default
            }
            return topViewController.preferredStatusBarStyle
        }
        return .default
    }
    
    @objc func back(_ sender: UIBarButtonItem) {
        self.popViewController(animated: true)
    }
}
