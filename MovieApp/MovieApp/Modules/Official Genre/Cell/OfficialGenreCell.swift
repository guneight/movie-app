//
//  OfficialGenreCell.swift
//  MovieApp
//
//  Created by AlephHV2D on 02/07/21.
//

import UIKit

class OfficialGenreCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var genreLabel: UILabel!
//    var genre: String? {
//        didSet {
//            genreLabel.text = genre
//        }
//    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        _setupView()
    }
    
    private func _setupView() {
        containerView.backgroundColor = MovieColor.palette.primaryBlue
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 16
        containerView.layer.shadowColor = MovieColor.palette.darkGray.cgColor
        containerView.layer.shadowRadius = 16
        genreLabel.font = MovieFont.H2
        genreLabel.textColor = MovieColor.palette.white
        genreLabel.textAlignment = .center
    }
}
