//
//  MovieCollectionViewCell.swift
//  WatchList
//
//  Created by Silvano de Souza Junior on 14/09/19.
//  Copyright © 2019 SilvanoJunior. All rights reserved.
//

import UIKit

protocol MovieFavoriteCellDelegate: class {
    func didSelectMovie(at index: Int)
}

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var favoriteImageView: UIImageView!
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
    
    var isFavorite = false {
        didSet {
            if isFavorite {
                favoriteImageView.image = UIImage(named: "like_filled")
            } else {
                favoriteImageView.image = UIImage(named: "like_unfilled")
            }
        }
    }
    
    var index: Int = 0
    var delegate: MovieFavoriteCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupDoubleTapGesture()
    }
    
    private func setupDoubleTapGesture() {
        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(MovieCollectionViewCell.tapEdit(sender:)))
        doubleTapGesture.numberOfTapsRequired = 2
        doubleTapGesture.delaysTouchesBegan = true
        doubleTapGesture.cancelsTouchesInView = true
        addGestureRecognizer(doubleTapGesture)
    }
    
    @objc func tapEdit(sender: UITapGestureRecognizer) {
        delegate?.didSelectMovie(at: index)
    }
}
