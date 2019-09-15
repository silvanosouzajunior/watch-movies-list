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
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    func getImagePathUrl() -> URL? {
        return ImageDownloaderHelper.getPosterUrl(with: movie.posterPath)
    }
}
