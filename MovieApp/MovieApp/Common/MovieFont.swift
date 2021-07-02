//
//  MovieFont.swift
//  MovieApp
//
//  Created by AlephHV2D on 01/07/21.
//

import UIKit

public class MovieFont {
    private init() {}
    
    public static var H1: UIFont {
        return UIFont.systemFont(ofSize: CGFloat(28.00))
    }
    public static var H2: UIFont {
        return UIFont.systemFont(ofSize: CGFloat(18.00))
    }
    
    public static var H3: UIFont {
        return UIFont.systemFont(ofSize: CGFloat(14.00))
    }
    
    public static var Body1: UIFont {
        return UIFont.systemFont(ofSize: CGFloat(14.00))
    }
    
    public static var Body2: UIFont {
        return UIFont.systemFont(ofSize: CGFloat(12.00))
    }
}
