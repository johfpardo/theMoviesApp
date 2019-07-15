//
//  MockMovieListViewModelCallback.swift
//  TheMoviesAppTests
//
//  Created by Jhon Fredy Pardo Patiño on 7/14/19.
//  Copyright © 2019 Jhon Fredy Pardo Patiño. All rights reserved.
//

import Foundation
@testable import TheMoviesApp

class MockMovieListViewModelCallback: MovieListViewModelCallback {
    var didCall_MoviesFinished: (() -> Void)?
    var didCall_Error:((String) -> Void)?
    
    func getMoviesFinished() {
        didCall_MoviesFinished?()
    }
    
    func error(message: String) {
        didCall_Error?(message)
    }
}
