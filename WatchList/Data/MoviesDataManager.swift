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
    let localMoviesManager = LocalMoviesManager()

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
}
