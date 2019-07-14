//
//  ConstantsRestApi.swift
//  TheMoviesApp
//
//  Created by Jhon Fredy Pardo Patiño on 7/13/19.
//  Copyright © 2019 Jhon Fredy Pardo Patiño. All rights reserved.
//

import Foundation

struct ConstantsRestApi {
    
    private init() {
    }
    
    static let version : String = "/3/"
    static let baseUrl : String = "https://api.themoviedb.org"+version
    static let apiKey : String = "4512642539e58f2f3d44ad921117faa0"
    static let movieKey : String = "movie/"
    static let keyApiKey : String = "?api_key="+apiKey
    static let keyPages : String = "&page="
    static let keyGetPopular : String = movieKey+"popular"
    static let urlGetPopular : String = keyGetPopular+keyApiKey
    static let urlGetPopularWithPage : String = urlGetPopular+keyPages
    static let urlAccessPoster = "https://image.tmdb.org/t/p/w185"
    static let urlAccessPosterDetail = "https://image.tmdb.org/t/p/w342"
}
