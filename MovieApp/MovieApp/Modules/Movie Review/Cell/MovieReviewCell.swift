//
//  MovieReviewCell.swift
//  MovieApp
//
//  Created by AlephHV2D on 02/07/21.
//

import UIKit

class MovieReviewCell: UITableViewCell {

    @IBOutlet weak var imageAvatarView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var updateDatelabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var separatorLine: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageAvatarView.clipsToBounds = true
        imageAvatarView.layer.cornerRadius = 24
        imageAvatarView.backgroundColor = MovieColor.palette.darkGray
        nameLabel.textColor = MovieColor.palette.primaryBlue
        nameLabel.font = MovieFont.H3
        updateDatelabel.textColor = MovieColor.palette.darkGray
        updateDatelabel.font = MovieFont.H3
        updateDatelabel.textAlignment = .left
        ratingLabel.textColor = MovieColor.palette.darkGray
        ratingLabel.font = MovieFont.H3
        ratingLabel.textAlignment = .left
        reviewLabel.textColor = MovieColor.palette.basicBlack
        reviewLabel.font = MovieFont.H3
        reviewLabel.numberOfLines = 0
        reviewLabel.textAlignment = .left
        separatorLine.backgroundColor = MovieColor.palette.lightGray
    }
    
    func setupView(data: Results) {
        imageAvatarView.image = UIImage(named: data.authorDetails.avatarPath ?? "")
        nameLabel.text = data.author.uppercased()
        updateDatelabel.text = data.updatedAt
        ratingLabel.text = "Rating : \(String(describing: data.authorDetails.rating))"
        reviewLabel.text = data.content
    }

    
}
