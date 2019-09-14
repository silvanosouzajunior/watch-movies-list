//
//  MovieService.swift
//  WatchList
//
//  Created by Silvano de Souza Junior on 14/09/19.
//  Copyright © 2019 SilvanoJunior. All rights reserved.
//

import Alamofire
import AlamofireImage

class MovieService {
    
    func getMovies(page: Int, completion: @escaping ([MovieData]) -> Void) {
        
        Alamofire.request(MoviesRouter.movies(page: page)).responseJSON { response in
            guard let data = response.data else {
                completion([])
                return
            }
            
            do {
                let response = try JSONDecoder().decode(MoviesResponse.self, from: data)
                completion(response.results ?? [])
            } catch {
                completion([])
            }
        }
    }
}
