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
    
    init(window: UIWindow) {
        self.window = window
        tabController = UITabBarController()
        moviesListCoordinator = MoviesListCoordinator()
    }

    func start() {
        setupTabBarController()
    }
    
    func setupTabBarController() {
        var controllers: [UIViewController] = []
        let moviesListTabBarItem = setMoviesListTabBarItem()
        controllers.append(moviesListTabBarItem)
        showAsRootViewController()
        tabController.viewControllers = controllers
        tabController.tabBar.isTranslucent = false
        moviesListCoordinator.start()
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
}
