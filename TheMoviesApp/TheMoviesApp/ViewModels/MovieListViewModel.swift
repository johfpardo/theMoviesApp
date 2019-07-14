//
//  MovieListViewModel.swift
//  TheMoviesApp
//
//  Created by Jhon Fredy Pardo Patiño on 7/13/19.
//  Copyright © 2019 Jhon Fredy Pardo Patiño. All rights reserved.
//

import UIKit

class MovieListViewModel {
    
    let callback : MovieListViewModelCallback
    var movies = [Movie]()
    var page : Int = 0
    
    init(callback: MovieListViewModelCallback) {
        self.callback = callback
    }
    
    func getMovies() {
        let url = ConstantsRestApi.baseUrl +
            (page == 0 ? ConstantsRestApi.urlGetPopular :
                ConstantsRestApi.urlGetPopularWithPage + "\(page + 1)")
        ApiAccess.shared.getMovies(completion: { (responseObject, error) in
            if let popularMovies = self.turnToObject(PopularMovies.self, from: responseObject) {
                self.page = popularMovies.page
                self.movies.append(contentsOf: popularMovies.results)
            }
            //Inform
            self.callback.getMoviesFinished()
            }, url)
    }
    
    func numberOfItemsInSection() -> Int {
        return movies.count
    }
    
    func turnToObject<T>(_ type: T.Type, from object: Any) -> T? where T: Decodable {
        do {
            guard let jsonData = try? JSONSerialization.data(withJSONObject: object, options: .prettyPrinted) else {
                return nil
            }
            let jsonStr = String(data: jsonData, encoding: .utf8)
            let data = jsonStr?.data(using: .utf8)
            return try JSONDecoder().decode(type, from: data!)
        } catch let error {
            print("Error Get As Data =\(error.localizedDescription)")
        }
        return nil
    }
}
