//
//  MoviesDataManager.swift
//  WatchList
//
//  Created by Silvano de Souza Junior on 14/09/19.
//  Copyright © 2019 SilvanoJunior. All rights reserved.
//

import UIKit

class MoviesDataManager {
    let movieService = MovieService()

    func getMovies(by page: Int, completion: @escaping ([MovieData]) -> Void) {
        movieService.getMovies(page: page, completion: { movies in
            completion(movies)
        })
    }
}
