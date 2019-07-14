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
        if let url = URL(string: ConstantsRestApi.urlAccessPosterDetail+movie.backdrop_path) {
            movieImg.pin_updateWithProgress = true
            movieImg.pin_setImage(from: url)
        }
        overviewText.text = movie.overview
        releaseDateText.text = movie.release_date
    }

}
