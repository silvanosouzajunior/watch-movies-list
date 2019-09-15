//
//  UserMovieTableViewCell.swift
//  WatchList
//
//  Created by Silvano de Souza Junior on 15/09/19.
//  Copyright © 2019 SilvanoJunior. All rights reserved.
//

import UIKit

class UserMovieTableViewCell: UITableViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
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
    
    var releaseDate: String? {
        didSet {
            releaseDateLabel.text = releaseDate
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
