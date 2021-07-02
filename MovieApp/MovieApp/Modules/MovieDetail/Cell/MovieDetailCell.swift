//
//  MovieDetailCell.swift
//  MovieApp
//
//  Created by AlephHV2D on 02/07/21.
//

import UIKit

public typealias ButtonEventHandler = () -> Void

class MovieDetailCell: UITableViewCell {

    @IBOutlet weak var backgroundImageVideo: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var taglineLabel: UILabel!
    @IBOutlet weak var taglineTitle: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var genreTitle: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var languageTitle: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var releaseDateTitle: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var durationTitle: UILabel!
    @IBOutlet weak var papularityLabel: UILabel!
    @IBOutlet weak var popularityTitle: UILabel!
    @IBOutlet weak var reviewButton: UIButton!
    var didButtonTapped: ButtonEventHandler?
    var didReviewButtonTapped: ButtonEventHandler?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundImageVideo.backgroundColor = MovieColor.palette.lightGray
        playButton.setImage(MovieImage().getImage(.playButton)?.withRenderingMode(.alwaysOriginal), for: .normal)
        iconImage.clipsToBounds = true
        iconImage.layer.cornerRadius = 8
        iconImage.backgroundColor = MovieColor.palette.darkGray
        titleLabel.textColor = MovieColor.palette.primaryBlue
        titleLabel.font = MovieFont.H1
        reviewButton.backgroundColor = MovieColor.palette.darkGray
        reviewButton.setTitleColor(MovieColor.palette.white, for: .normal)
        reviewButton.setTitle("SHOW REVIEW", for: .normal)
        reviewButton.clipsToBounds = true
        reviewButton.layer.cornerRadius = 8
        playButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(playButtonTapped)))
        reviewButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(reviewButtonTapped)))
        genreLabel.text = "Genre"
        languageLabel.text = "Review"
        releaseDateLabel.text = "Release Date"
        durationLabel.text = "Duration"
        papularityLabel.text = "Rate"
    }

    @objc func playButtonTapped() {
        didButtonTapped?()
    }
    
    @objc func reviewButtonTapped() {
        didButtonTapped?()
    }
    
    func setupView(data: MovieDetailModel) {
        backgroundImageVideo.image = UIImage(named: data.backdropPath)
        iconImage.image = UIImage(named: data.posterPath)
        titleLabel.text = data.originalTitle.uppercased()
        taglineTitle.text = data.tagline
        genreTitle.text = data.genres[0].name
        languageTitle.text = data.overview
        releaseDateTitle.text = data.releaseDate
        durationTitle.text = "\(Int(data.runtime/60))" + " Hour" + "\(data.runtime%60)" + " Minutes"
        popularityTitle.text = "\(data.voteAverage)"
    }
    
}
