//
//  ViewController+Extenstion.swift
//  MovieApp
//
//  Created by AlephHV2D on 02/07/21.
//

import UIKit

extension UIViewController {
    
    func hideKeyboardOnTapAnywhere() {
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(_dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func _dismissKeyboard() {
        view.endEditing(true)
    }
}
