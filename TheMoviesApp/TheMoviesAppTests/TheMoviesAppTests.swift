//
//  TheMoviesAppTests.swift
//  TheMoviesAppTests
//
//  Created by Jhon Fredy Pardo Patiño on 7/13/19.
//  Copyright © 2019 Jhon Fredy Pardo Patiño. All rights reserved.
//

import XCTest
@testable import TheMoviesApp

class TheMoviesAppTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetMoviesSuccesfully() {
        let mockCallback = MockMovieListViewModelCallback()
        let expectation = self.expectation(description: "get movies from repo")
        let listViewModel = MovieListViewModel(callback: mockCallback)
        listViewModel.getMovies()
        mockCallback.didCall_MoviesFinished = {
            XCTAssert(listViewModel.movies.count > 0)
            print(listViewModel.movies)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3.0)
    }
}
