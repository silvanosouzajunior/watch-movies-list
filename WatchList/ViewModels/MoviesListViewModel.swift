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
    
    var movies: [MovieData]? {
        didSet {
            viewDelegate?.didFinishFetchMovies()
        }
    }
    
    init(moviesDataManager: MoviesDataManager) {
        self.moviesDataManager = moviesDataManager
    }
    
    func getMovies(by page: Int) {
        moviesDataManager?.getMovies(by: page, completion: { movies in
            self.movies = movies
        })
    }
    
    func getPosterUrl(with movie: MovieData) -> URL? {
         return URL(string: "\(Constants.posterUrl)\(movie.posterPath)")
    }
}
