//
//  UserMoviesCoordinator.swift
//  WatchList
//
//  Created by Silvano de Souza Junior on 15/09/19.
//  Copyright © 2019 SilvanoJunior. All rights reserved.
//

import UIKit

class UserMoviesCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var userMoviesType: UserMoviesType
    
    init(userMoviesType: UserMoviesType, navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
        self.userMoviesType = userMoviesType
    }
    
    public var rootViewController: UIViewController {
        return navigationController
    }
    
    func start() {
        showUserMoviesList()
    }
    
    func showUserMoviesList() {
        let storyboard = UIStoryboard(name: "MoviesList", bundle: nil)
        
        guard let userMoviesViewController = storyboard.instantiateViewController(withIdentifier: "UserMoviesViewController") as? UserMoviesTableViewController else {
            return
        }
        
        let moviesDataManager = MoviesDataManager()
        let viewModel = UserMoviesViewModel(moviesDataManager: moviesDataManager, userMoviesType: userMoviesType)
        userMoviesViewController.viewModel = viewModel
        
        if userMoviesType == .favorites {
            navigationController.setViewControllers([userMoviesViewController], animated: true)
        } else {
            navigationController.show(userMoviesViewController, sender: nil)
        }
    }
}
