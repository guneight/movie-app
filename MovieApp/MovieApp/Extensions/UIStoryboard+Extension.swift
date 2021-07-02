//
//  UIStoryboard+Extension.swift
//  MovieApp
//
//  Created by AlephHV2D on 02/07/21.
//

import UIKit

extension UIStoryboard {

    func instantiateViewController<T: UIViewController>(ofType _: T.Type, withIdentifier identifier: String? = nil) -> T {
        let identifier = identifier ?? String(describing: T.self)
        return (instantiateViewController(withIdentifier: identifier) as? T)!
    }

}
