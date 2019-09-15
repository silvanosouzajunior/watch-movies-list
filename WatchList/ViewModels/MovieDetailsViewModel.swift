//
//  MovieDetailsViewModel.swift
//  WatchList
//
//  Created by Silvano de Souza Junior on 15/09/19.
//  Copyright © 2019 SilvanoJunior. All rights reserved.
//

import UIKit

class MovieDetailsViewModel {
    var movie: Movie
    var moviesDataManager: MoviesDataManager?
    
    init(movie: Movie, moviesDataManager: MoviesDataManager) {
        self.movie = movie
        self.moviesDataManager = moviesDataManager
    }
    
    func getImagePathUrl() -> URL? {
        return ImageDownloaderHelper.getPosterUrl(with: movie.posterPath)
    }
    
    func addMovieToWatchList() -> String {
        let watchLater = moviesDataManager?.watchMovieLater(movie: movie)
        return getWatchListButtonTitle(watchLater: watchLater)
    }
    
    func getWatchListButtonTitle(watchLater: Bool?) -> String {
        let watchMovieLater = (watchLater != nil ? watchLater : movie.watchLater) ?? false
        
        if watchMovieLater {
            return "Remove from the WatchList"
        }
        
        return "Add to the Watch List"
        
    }
}
