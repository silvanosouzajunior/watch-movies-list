//
//  AppCoordinator.swift
//  WatchList
//
//  Created by Silvano de Souza Junior on 14/09/19.
//  Copyright © 2019 SilvanoJunior. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    
    var window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        showWatchList()
    }
    
    func showWatchList() {
        let moviesListCoordinator = MoviesListCoordinator(window: window)
        moviesListCoordinator.start()
    }
}
