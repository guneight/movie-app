//
//  MovieColor.swift
//  MovieApp
//
//  Created by AlephHV2D on 01/07/21.
//

import Foundation

import UIKit

public enum MovieColor {
    public struct palette {
        private init() {}
        
        public static let primaryBlue = #colorLiteral(red: 0, green: 0.568627451, blue: 0.8078431373, alpha: 1)
        public static let secondaryBlue = #colorLiteral(red: 0.1254901961, green: 0.768627451, blue: 0.9568627451, alpha: 1)
        public static let basicBlack = #colorLiteral(red: 0.07450980392156863, green: 0.07450980392156863, blue: 0.07450980392156863, alpha: 1)
        public static let darkGray = #colorLiteral(red: 0.5294117647058824, green: 0.5450980392156862, blue: 0.5333333333333333, alpha: 1)
        public static let lightGray = #colorLiteral(red: 0.8862745098039215, green: 0.8862745098039215, blue: 0.8862745098039215, alpha: 1)
        public static let white = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        public static let tertiary = #colorLiteral(red: 0.9254901961, green: 0.9764705882, blue: 1, alpha: 1)
    }
}
