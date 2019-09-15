//
//  MoviesDataManager.swift
//  WatchList
//
//  Created by Silvano de Souza Junior on 14/09/19.
//  Copyright © 2019 SilvanoJunior. All rights reserved.
//

import UIKit

class MoviesDataManager {
    let movieService: MovieService
    let localMoviesManager: LocalMoviesManager
    
    init(movieService: MovieService = MovieService(), localMoviesManager: LocalMoviesManager = LocalMoviesManager()) {
        self.movieService = movieService
        self.localMoviesManager = localMoviesManager
    }

    func getMovies(by page: Int, completion: @escaping (_ recentMovies: [Movie], _ localMovies: Bool) -> Void) {
        let localMovies = localMoviesManager.getLocalMovies()
        
        guard localMovies.count < page * 20 else {
            completion(localMovies, true)
            return
        }
        
        movieService.getMovies(page: page, completion: { moviesData in
            self.localMoviesManager.saveLocalMovies(moviesData: moviesData)
            completion(self.localMoviesManager.getRecentLocalMovies(count: moviesData.count), false)
        })
    }
    
    func getFavoriteMovies() -> [Movie] {
        let localMovies = localMoviesManager.getLocalMovies()
        return localMovies.filter({ $0.isFavorite })
    }
    
    func getWatchListMovies() -> [Movie] {
        let localMovies = localMoviesManager.getLocalMovies()
        return localMovies.filter({ $0.watchLater })
    }

    func favoriteMovie(movie: Movie) -> Bool {
        return localMoviesManager.favoriteMovie(movie: movie)
    }
    
    func watchMovieLater(movie: Movie) -> Bool {
        return localMoviesManager.watchMovieLater(movie: movie)
    }
}
