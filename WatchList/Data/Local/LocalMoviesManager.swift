//
//  LocalMoviesManager.swift
//  WatchList
//
//  Created by Silvano de Souza Junior on 15/09/19.
//  Copyright © 2019 SilvanoJunior. All rights reserved.
//

import Foundation
import RealmSwift

class LocalMoviesManager {
    
    let realm = try! Realm()

    func saveLocalMovies(moviesData: [MovieData]) {
        let _ = moviesData.compactMap({
            saveLocalMovie(movieData: $0)
        })
    }
    
    func saveLocalMovie(movieData: MovieData) {
        let localMovie = Movie()
        localMovie.id = movieData.id ?? 0
        localMovie.title = movieData.title ?? ""
        localMovie.voteAverage = movieData.voteAverage ?? 0
        localMovie.releaseDate = movieData.releaseDate ?? ""
        localMovie.overview = movieData.overview ?? ""
        localMovie.posterPath = movieData.posterPath ?? ""
        
        try! realm.write {
            realm.add(localMovie)
        }
    }
    
    func getLocalMovies() -> [Movie] {
        return realm.objects(Movie.self).toArray(type: Movie.self)
    }
    
    func getRecentLocalMovies(count: Int) -> [Movie] {
        let localMovies = getLocalMovies()
        return localMovies.suffix(count)
    }
}
