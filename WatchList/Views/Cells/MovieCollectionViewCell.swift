//
//  MovieCollectionViewCell.swift
//  WatchList
//
//  Created by Silvano de Souza Junior on 14/09/19.
//  Copyright © 2019 SilvanoJunior. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    var posterUrl: URL? {
        didSet {
            posterImageView.af_setImage(withURL: posterUrl!)
        }
    }
}
