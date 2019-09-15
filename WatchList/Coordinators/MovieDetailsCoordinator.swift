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
    var moviesDataManager: MoviesDataManager

    init(navigationController: UINavigationController, movie: Movie, moviesDataManager: MoviesDataManager) {
        self.navigationController = navigationController
        self.movie = movie
        self.moviesDataManager = moviesDataManager
    }
    
    func start() {
        showMovieDetails()
    }
    
    func showMovieDetails() {
        let storyboard = UIStoryboard(name: "MoviesList", bundle: nil)
        
        guard let movieDetailsViewController = storyboard.instantiateViewController(withIdentifier: "MovieDetailsViewController") as? MovieDetailsViewController else {
            return
        }
        
        let viewModel = MovieDetailsViewModel(movie: movie, moviesDataManager: moviesDataManager)
        movieDetailsViewController.viewModel = viewModel
        
        navigationController.show(movieDetailsViewController, sender: nil)
    }
}
