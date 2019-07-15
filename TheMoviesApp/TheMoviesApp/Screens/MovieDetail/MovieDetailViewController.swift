//
//  MovieDetailViewController.swift
//  TheMoviesApp
//
//  Created by Jhon Fredy Pardo Patiño on 7/14/19.
//  Copyright © 2019 Jhon Fredy Pardo Patiño. All rights reserved.
//

import UIKit
import PINRemoteImage

class MovieDetailViewController: UIViewController {

    var movie : Movie!
    
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var overviewText: UILabel!
    @IBOutlet weak var releaseDateText: UILabel!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = movie.title
        movieImg.image = UIImage(named: "icons8-movie-100-2")
        let imagePath = movie.backdrop_path ?? movie.poster_path
        if let imagePath = imagePath, let url = URL(string: ConstantsRestApi.urlAccessPosterDetail+imagePath) {
            movieImg.pin_updateWithProgress = true
            movieImg.pin_setImage(from: url)
        } else {
            movieImg.image = UIImage(named: "not_found")
        }
        overviewText.text = movie.overview
        releaseDateText.text = movie.release_date
    }

}
