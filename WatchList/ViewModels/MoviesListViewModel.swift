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
}

class MoviesListViewModel {
    var moviesDataManager: MoviesDataManager?
    var viewDelegate: MoviesListViewModelViewDelegate?
    var fetchingMoreMovies = false
    var shouldFetchMoreMovies = true
    var currentMoviesPage = 1
    
    var movies = [MovieData]() {
        didSet {
            filteredMovies = movies
            currentMoviesPage = currentMoviesPage + 1
            fetchingMoreMovies = false
            viewDelegate?.didFinishFetchMovies()
        }
    }
    
    var filteredMovies = [MovieData]()
    
    init(moviesDataManager: MoviesDataManager) {
        self.moviesDataManager = moviesDataManager
    }
    
    func getMovies() {
        guard shouldFetchMoreMovies, !fetchingMoreMovies else { return }
        
        fetchingMoreMovies = true
        moviesDataManager?.getMovies(by: currentMoviesPage, completion: { downloadedMovies in
            self.movies.append(contentsOf: downloadedMovies)
            self.shouldFetchMoreMovies = downloadedMovies.count > 0
        })
    }
    
    func getPosterUrl(with movie: MovieData) -> URL? {
         return URL(string: "\(Constants.posterUrl)\(movie.posterPath ?? "")")
    }
    
    func filterMovies(by name: String) {
        if name.isEmpty {
            filteredMovies = movies
        } else {
            filteredMovies = movies.filter({ $0.title?.lowercased().contains(name.lowercased()) ?? false })
        }
    }
}
