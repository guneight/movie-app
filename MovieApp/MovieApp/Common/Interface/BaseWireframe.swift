//
//  BaseWireframe.swift
//  MovieApp
//
//  Created by AlephHV2D on 01/07/21.
//

import UIKit

class BaseWireframe {
    fileprivate var _viewController: UIViewController
    fileprivate var _temporaryStoredViewController: UIViewController?
    
    init(viewController: UIViewController) {
        _temporaryStoredViewController = viewController
        _viewController = viewController
    }
}

extension BaseWireframe {

    var viewController: UIViewController {
        defer { _temporaryStoredViewController = nil }
        return _viewController
    }

    var navigationController: UINavigationController? {
        return viewController.navigationController
    }

    var tabBarController: UITabBarController? {
        return viewController.tabBarController
    }

}

extension UIViewController {
    func presentWireframe(_ wireframe: BaseWireframe, shouldAddNavigation: Bool = false, animated: Bool = true, completion: (() -> Void)? = nil) {
        wireframe.viewController.modalPresentationStyle = .fullScreen
        let navController: MovieNavigationController = MovieNavigationController()
        navController.setRootWireframe(wireframe)
        navController.modalPresentationStyle = .fullScreen
        present(shouldAddNavigation ? navController : wireframe.viewController, animated: animated, completion: completion)
    }

    func previousScreen(viewController: UIViewController) -> String {
        if let count = self.navigationController?.viewControllers.count, count > 1 {
            if let previousViewController = self.navigationController?.viewControllers[count - 2] {
                return NSStringFromClass(previousViewController.classForCoder)
            }
        }
        return ""
    }
}

extension UINavigationController {

    override open var childForStatusBarStyle: UIViewController? {
        return self.topViewController
    }

    func pushWireframe(_ wireframe: BaseWireframe, hidesTabBar: Bool = false, animated: Bool = true) {
        let vc = wireframe.viewController
        vc.hidesBottomBarWhenPushed = hidesTabBar
        pushViewController(wireframe.viewController, animated: animated)
    }

    func setRootWireframe(_ wireframe: BaseWireframe, animated: Bool = true) {
        setViewControllers([wireframe.viewController], animated: animated)
    }

    func setNavigationBarColor(_ color: NavigationBarColor) {
        switch color {
        case .blue:
            navigationBar.barTintColor = MovieColor.palette.primaryBlue
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: MovieColor.palette.white, NSAttributedString.Key.font: MovieFont.H2]
            navigationBar.tintColor = MovieColor.palette.white
        case .white:
            navigationBar.barTintColor = MovieColor.palette.white
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: MovieColor.palette.primaryBlue, NSAttributedString.Key.font: MovieFont.H2]
            navigationBar.tintColor = MovieColor.palette.primaryBlue
            
        }
        navigationBar.isTranslucent = false
        navigationBar.shadowImage = UIImage()
        navigationBar.setBackgroundImage(UIImage(), for: .default)
    }

    func popToWireframe(_ wireframe: BaseWireframe, animated: Bool = true) {
        let controller = wireframe.viewController

        for vc in viewControllers {
            let vcToPop = NSStringFromClass(controller.classForCoder).components(separatedBy: ".").last!
            let currentVC = NSStringFromClass(vc.classForCoder).components(separatedBy: ".").last!
            if currentVC == vcToPop {
                popToViewController(vc, animated: true)
            }
        }
    }
}
