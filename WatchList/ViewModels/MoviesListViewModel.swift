//
//  MoviesListViewModel.swift
//  WatchList
//
//  Created by Silvano de Souza Junior on 14/09/19.
//  Copyright © 2019 SilvanoJunior. All rights reserved.
//

import UIKit

protocol MoviesListViewModelViewDelegate: class {
    func didFinishFetchMovies()
    func didSetFavorite(index: Int, isFavorite: Bool)
}

class MoviesListViewModel {
    var moviesDataManager: MoviesDataManager?
    var viewDelegate: MoviesListViewModelViewDelegate?
    var coordinatorDelegate: MovieListViewModelCoordinatorDelegate?
    var fetchingMoreMovies = false
    var shouldFetchMoreMovies = true
    var currentMoviesPage = 1
    
    var movies: [Movie]? {
        didSet {
            filteredMovies = movies
            currentMoviesPage = currentMoviesPage + 1
            fetchingMoreMovies = false
            viewDelegate?.didFinishFetchMovies()
        }
    }
    
    var filteredMovies: [Movie]?
    
    init(moviesDataManager: MoviesDataManager) {
        self.moviesDataManager = moviesDataManager
    }
    
    func getMovies() {
        guard shouldFetchMoreMovies, !fetchingMoreMovies else { return }
        
        fetchingMoreMovies = true
        moviesDataManager?.getMovies(by: currentMoviesPage, completion: { recentMovies, localMovies in
            if localMovies {
                self.currentMoviesPage = recentMovies.count / 20
                self.movies = recentMovies
            } else if self.movies != nil {
                self.movies!.append(contentsOf: recentMovies)
            } else {
                self.movies = recentMovies
            }
            self.shouldFetchMoreMovies = recentMovies.count > 0
        })
    }
    
    func filterMovies(by name: String) {
        if name.isEmpty {
            filteredMovies = movies
        } else {
            filteredMovies = movies?.filter({ $0.title.lowercased().contains(name.lowercased()) })
        }
    }
    
    func showMovieDetails(movie: Movie?) {
        coordinatorDelegate?.showMovieDetails(movie: movie)
    }
    
    func favoriteMovie(movie: Movie, index: Int) {
        let isFavorite = moviesDataManager?.favoriteMovie(movie: movie) ?? false
        viewDelegate?.didSetFavorite(index: index, isFavorite: isFavorite)
    }
    
    func showFavoriteAlert() {
        coordinatorDelegate?.showFavoriteAlert()
    }
}
