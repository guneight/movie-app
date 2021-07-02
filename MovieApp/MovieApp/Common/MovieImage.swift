//
//  MovieImage.swift
//  MovieApp
//
//  Created by AlephHV2D on 01/07/21.
//

import UIKit

public enum MovieIcon: String {
    case backIcon
    case logo
    case playButton
}

final class MovieImage {
    
    func getImage(_ type: MovieIcon) -> UIImage? {
        switch type {
        case .backIcon:
            return UIImage(named: "backIcon")
        case .logo:
            return UIImage(named: "logo")
        case .playButton:
            return UIImage(named: "playButton")
        }
    }
}

