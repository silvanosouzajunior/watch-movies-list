//
//  MovieData.swift
//  WatchList
//
//  Created by Silvano de Souza Junior on 14/09/19.
//  Copyright © 2019 SilvanoJunior. All rights reserved.
//

import Foundation

struct MovieData: Codable {
    let id: Int?
    let posterPath: String?
    let title: String?
    let voteAverage: Int?
    let overview: String?
    let releaseDate: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
        case title
        case voteAverage = "vote_average"
        case overview
        case releaseDate = "release_date"
    }
}
