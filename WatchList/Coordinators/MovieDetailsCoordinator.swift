//
//  MovieDetailsCoordinator.swift
//  WatchList
//
//  Created by Silvano de Souza Junior on 15/09/19.
//  Copyright © 2019 SilvanoJunior. All rights reserved.
//

import UIKit

class MovieDetailsCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var movie: Movie

    init(navigationController: UINavigationController, movie: Movie) {
        self.navigationController = navigationController
        self.movie = movie
    }
    
    func start() {
        showMovieDetails()
    }
    
    func showMovieDetails() {
        let storyboard = UIStoryboard(name: "MoviesList", bundle: nil)
        
        guard let movieDetailsViewController = storyboard.instantiateViewController(withIdentifier: "MovieDetailsViewController") as? MovieDetailsViewController else {
            return
        }
        
        let viewModel = MovieDetailsViewModel(movie: movie)
        movieDetailsViewController.viewModel = viewModel
        
        navigationController.show(movieDetailsViewController, sender: nil)
    }
}
