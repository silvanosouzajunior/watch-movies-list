//
//  TabCoordinator.swift
//  WatchList
//
//  Created by Silvano de Souza Junior on 15/09/19.
//  Copyright © 2019 SilvanoJunior. All rights reserved.
//

import UIKit

class TabCoordinator: NSObject, Coordinator {
    var window: UIWindow
    let tabController: UITabBarController
    let moviesListCoordinator: MoviesListCoordinator
    let userMoviesCoordinator: UserMoviesCoordinator
    
    init(window: UIWindow) {
        self.window = window
        tabController = UITabBarController()
        moviesListCoordinator = MoviesListCoordinator()
        userMoviesCoordinator = UserMoviesCoordinator(userMoviesType: .favorites)
    }

    func start() {
        setupTabBarController()
    }
    
    func setupTabBarController() {
        var controllers: [UIViewController] = []
        let moviesListTabBarItem = setMoviesListTabBarItem()
        let userMoviesTabBarItem = setUserMoviesTabBarItem()
        controllers.append(moviesListTabBarItem)
        controllers.append(userMoviesTabBarItem)
        
        showAsRootViewController()
        tabController.viewControllers = controllers
        tabController.tabBar.isTranslucent = false
        moviesListCoordinator.start()
        userMoviesCoordinator.start()
    }
    
    private func showAsRootViewController() {
        window.rootViewController = tabController
        window.makeKeyAndVisible()
    }
    
    private func setMoviesListTabBarItem() -> UIViewController {
        let moviesListRootController = moviesListCoordinator.rootViewController
        let listImage = UIImage(named: "list")
        let tabBarItem = UITabBarItem(title: "Movies", image: listImage, tag: 0)
        moviesListRootController.tabBarItem = tabBarItem
        return moviesListRootController
    }
    
    private func setUserMoviesTabBarItem() -> UIViewController {
        let userMoviesRootController = userMoviesCoordinator.rootViewController
        let favoriteImage = UIImage(named: "favorite")
        let tabBarItem = UITabBarItem(title: "Favorites", image: favoriteImage, tag: 0)
        userMoviesRootController.tabBarItem = tabBarItem
        return userMoviesRootController
    }
}
