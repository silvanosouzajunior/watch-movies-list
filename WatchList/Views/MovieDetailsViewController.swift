//
//  MovieDetailsViewController.swift
//  WatchList
//
//  Created by Silvano de Souza Junior on 15/09/19.
//  Copyright © 2019 SilvanoJunior. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var viewModel: MovieDetailsViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
    }
    
    func setupLayout() {
        title = viewModel?.movie.title
        posterImageView.af_setImage(withURL: viewModel!.getImagePathUrl()!)
        movieNameLabel.text = viewModel?.movie.title
        releaseDateLabel.text = viewModel?.movie.releaseDate
        ratingLabel.text = viewModel?.movie.voteAverage.description
        descriptionLabel.text = viewModel?.movie.overview
    }
}
