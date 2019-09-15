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
    func showFavoriteAlert()
}

class MoviesListCoordinator: Coordinator {

    var navigationController: UINavigationController

    init() {
        self.navigationController = UINavigationController()
    }
    
    public var rootViewController: UIViewController {
        return navigationController
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
        navigationController.setViewControllers([moviesListViewController], animated: true)
    }
}

extension MoviesListCoordinator: MovieListViewModelCoordinatorDelegate {
    func showMovieDetails(movie: Movie?) {
        guard let movie = movie else { return }
        
        let movieDetailsCoordinator = MovieDetailsCoordinator(navigationController: navigationController, movie: movie)
        movieDetailsCoordinator.start()
    }
    
    func showFavoriteAlert() {
        let title = "Add a Movie to your Favorite List"
        let messsage = "If you want to mark a movie as favorite, you just need to double tap on the movie you want"
        let alertController = UIAlertController(title: title, message: messsage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(okAction)
        navigationController.present(alertController, animated: true, completion: nil)
    }
}
