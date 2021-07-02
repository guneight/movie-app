//
//  ViewInterface.swift
//  MovieApp
//
//  Created by AlephHV2D on 01/07/21.
//

import UIKit

protocol ViewInterface: class {
    func hideProgressHUD(view: UIView)
    func showProgressHUD()
}

extension ViewInterface {
    func hideProgressHUD(view: UIView) {}
    
    func showProgressHUD() {
        DispatchQueue.main.async {
            
        }
    }
    
    func hideProgressHUD(completion: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            
        }
    }
}
