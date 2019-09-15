//
//  Movie.swift
//  WatchList
//
//  Created by Silvano de Souza Junior on 14/09/19.
//  Copyright © 2019 SilvanoJunior. All rights reserved.
//

import Foundation
import RealmSwift

class Movie: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var posterPath = ""
    @objc dynamic var title = ""
    @objc dynamic var voteAverage: Float = 0
    @objc dynamic var overview = ""
    @objc dynamic var releaseDate = ""
    @objc dynamic var isFavorite = false
    @objc dynamic var watchLater = false
    
    override static func primaryKey() -> String? {
        return "id"
    }    
}
