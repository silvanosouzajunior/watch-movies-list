//
//  MoviesListCoordinator.swift
//  WatchList
//
//  Created by Silvano de Souza Junior on 14/09/19.
//  Copyright © 2019 SilvanoJunior. All rights reserved.
//

import UIKit

protocol MovieListViewModelCoordinatorDelegate: class {
    func showMovieDetails(movie: Movie?)
}

class MoviesListCoordinator: Coordinator {

    var window: UIWindow
    var navigationController: UINavigationController

    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
    }
    
    func start() {
        showMoviesList()
    }
    
    func showMoviesList() {
        let storyboard = UIStoryboard(name: "MoviesList", bundle: nil)
        
        guard let moviesListViewController = storyboard.instantiateViewController(withIdentifier: "MoviesListViewController") as? MoviesListViewController else {
            return
        }
        
        let moviesDataManager = MoviesDataManager()
        let viewModel = MoviesListViewModel(moviesDataManager: moviesDataManager)
        viewModel.coordinatorDelegate = self
        moviesListViewController.viewModel = viewModel
        showAsRootViewController(moviesListViewController)
    }
    
    internal func showAsRootViewController(_ controller: UIViewController) {
        navigationController.viewControllers = [controller]
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

extension MoviesListCoordinator: MovieListViewModelCoordinatorDelegate {
    func showMovieDetails(movie: Movie?) {
        guard let movie = movie else { return }
        
        let movieDetailsCoordinator = MovieDetailsCoordinator(navigationController: navigationController, movie: movie)
        movieDetailsCoordinator.start()
    }
}
