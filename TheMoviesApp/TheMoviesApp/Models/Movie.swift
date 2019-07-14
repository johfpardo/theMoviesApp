//
//  Movie.swift
//  TheMoviesApp
//
//  Created by Jhon Fredy Pardo Patiño on 7/13/19.
//  Copyright © 2019 Jhon Fredy Pardo Patiño. All rights reserved.
//

import UIKit

struct Movie : Codable {
    var id : Int
    var title : String
    var poster_path : String
    var overview : String
    var release_date : String
}
