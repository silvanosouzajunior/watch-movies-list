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
            posterImageView.af_setImage(withURL: posterUrl!)
        }
    }
    
    var movie: MovieData? {
        didSet {
            movieTitleLabel.text = movie?.title
            ratingLabel.text = movie?.voteAverage?.description
        }
    }
    
}
