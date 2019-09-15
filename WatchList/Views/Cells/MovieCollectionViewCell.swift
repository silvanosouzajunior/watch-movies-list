//
//  MovieCollectionViewCell.swift
//  WatchList
//
//  Created by Silvano de Souza Junior on 14/09/19.
//  Copyright © 2019 SilvanoJunior. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    
    var posterUrl: URL? {
        didSet {
            posterImageView.image = nil
            posterImageView.af_setImage(withURL: posterUrl!)
        }
    }
    
    var movieTitle: String? {
        didSet {
            movieTitleLabel.text = movieTitle
        }
    }
    
    var movieRating: String? {
        didSet {
            ratingLabel.text = movieRating
        }
    }
}
