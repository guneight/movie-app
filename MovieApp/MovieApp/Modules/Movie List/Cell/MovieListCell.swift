//
//  MovieListCell.swift
//  MovieApp
//
//  Created by AlephHV2D on 02/07/21.
//

import UIKit

class MovieListCell: UICollectionViewCell {

    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var titleMovieLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        titleMovieLabel.font = MovieFont.H3
        titleMovieLabel.textColor = MovieColor.palette.basicBlack
        titleMovieLabel.textAlignment = .center
        titleMovieLabel.numberOfLines = 2
        imageMovie.clipsToBounds = true
        imageMovie.layer.cornerRadius = 16
    }
    
    func setupView(image: String, title: String) {
        imageMovie.image = UIImage(named: image)
        titleMovieLabel.text = title
    }
    
}
