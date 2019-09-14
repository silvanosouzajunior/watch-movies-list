//
//  MoviesRouter.swift
//  WatchList
//
//  Created by Silvano de Souza Junior on 14/09/19.
//  Copyright © 2019 SilvanoJunior. All rights reserved.
//

import Alamofire

enum MoviesRouter: APIConfiguration {
    
    case movies(page: Int)
    
    var method: HTTPMethod {
        switch self {
        case .movies:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .movies(let page):
            return "?primary_release_year=2019&sort_by=vote_average.desc&api_key=\(Constants.apiKey)&page=\(page)"
        }
    }
    
    var parameters: Parameters? {
        return nil
    }
    
    func asURLRequest() throws -> URLRequest {
        let baseUrl = "https://api.themoviedb.org/3/discover/movie\(path)"
        let url = try baseUrl.asURL()
        
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = method.rawValue
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return urlRequest
    }
}
