//
//  MoviesListCoordinator.swift
//  WatchList
//
//  Created by Silvano de Souza Junior on 14/09/19.
//  Copyright © 2019 SilvanoJunior. All rights reserved.
//

import UIKit

class MoviesListCoordinator: Coordinator {

    var window: UIWindow
    var moviesListViewController: MoviesListViewController?

    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "MoviesList", bundle: nil)
        let navigationController = storyboard.instantiateViewController(withIdentifier: "MoviesListNavigation") as? UINavigationController
        moviesListViewController = navigationController?.viewControllers.first as? MoviesListViewController
        
        guard let moviesListViewController = moviesListViewController else { return }
        
        let viewModel = MoviesListViewModel()
        moviesListViewController.viewModel = viewModel
        window.rootViewController = navigationController
    }
}
