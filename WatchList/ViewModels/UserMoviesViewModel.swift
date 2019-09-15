//
//  UserMoviesViewModel.swift
//  WatchList
//
//  Created by Silvano de Souza Junior on 15/09/19.
//  Copyright © 2019 SilvanoJunior. All rights reserved.
//

import UIKit

enum UserMoviesType {
    case favorites
    case watchList
}

class UserMoviesViewModel {
    
    var movies: [Movie]?
    var moviesDataManager: MoviesDataManager?
    var userMoviesType: UserMoviesType
    
    init(moviesDataManager: MoviesDataManager, userMoviesType: UserMoviesType) {
        self.moviesDataManager = moviesDataManager
        self.userMoviesType = userMoviesType
    }
    
    func getFavoriteMovies() {
        movies = moviesDataManager?.getFavoriteMovies() ?? []
    }
    
    func getNavigationTitle() -> String {
        switch userMoviesType {
        case .favorites:
            return "Favorites"
        case .watchList:
            return "WatchList"
        }
    }
}
