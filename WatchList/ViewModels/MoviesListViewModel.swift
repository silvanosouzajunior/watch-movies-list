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
    func didLoadPoster(poster: UIImage, index: Int)
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
    
    func getPosterImage(for movie: MovieData, at index: Int) {
        moviesDataManager?.getPoster(posterPath: movie.posterPath, completion: { image in
            if let posterImage = image {
                self.viewDelegate?.didLoadPoster(poster: posterImage, index: index)
            }
        })
    }
}
