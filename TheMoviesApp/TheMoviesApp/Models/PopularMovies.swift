//
//  PopularMovies.swift
//  TheMoviesApp
//
//  Created by Jhon Fredy Pardo Patiño on 7/14/19.
//  Copyright © 2019 Jhon Fredy Pardo Patiño. All rights reserved.
//

import Foundation

struct PopularMovies : Codable {
    var page : Int
    var results : [Movie]
    var total_pages : Int
}
