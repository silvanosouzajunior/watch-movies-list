//
//  ImageDownloaderHelper.swift
//  WatchList
//
//  Created by Silvano de Souza Junior on 15/09/19.
//  Copyright © 2019 SilvanoJunior. All rights reserved.
//

import Foundation

class ImageDownloaderHelper {
    static func getPosterUrl(with path: String) -> URL? {
        return URL(string: "\(Constants.posterUrl)\(path)")
    }
}
