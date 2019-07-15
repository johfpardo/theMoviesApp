//
//  MovieListViewController.swift
//  TheMoviesApp
//
//  Created by Jhon Fredy Pardo Patiño on 7/13/19.
//  Copyright © 2019 Jhon Fredy Pardo Patiño. All rights reserved.
//

import UIKit
import PINRemoteImage

class MovieListViewController: UIViewController {

    //Constants
    let cellMargin : CGFloat = 4.0
    let numberOfCells : CGFloat = 2.0
    
    @IBOutlet weak var moviewColV: UICollectionView!
    var listViewModel : MovieListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moviewColV.delegate = self
        moviewColV.dataSource = self
        
        listViewModel = MovieListViewModel(callback: self)
        listViewModel.getMovies()
    }
}

extension MovieListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listViewModel.numberOfItemsInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        self.moviewColV.register(UINib(nibName: "MovieViewCell", bundle: nil), forCellWithReuseIdentifier: "MovieCellItem")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCellItem", for: indexPath) as! MovieViewCell
        cell.moviePoster.image = UIImage(named: "icons8-movie-100-2")
        if let posterPath = self.listViewModel.movies[indexPath.row].poster_path,
            let url = URL(string: ConstantsRestApi.urlAccessPoster+posterPath) {
            cell.moviePoster.pin_updateWithProgress = true
            cell.moviePoster.pin_setImage(from: url)
        } else {
           cell.moviePoster.image = UIImage(named: "not_found")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == listViewModel.movies.count - 1 {
            listViewModel.getMovies()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = self.listViewModel.movies[indexPath.row]
        let nextSb = UIStoryboard(name: "MovieDetail", bundle: nil)
        if let nextVc = nextSb.instantiateInitialViewController() as? MovieDetailViewController {
            nextVc.movie = movie
            let barBtn = UIBarButtonItem()
            barBtn.title = ""
            navigationItem.backBarButtonItem = barBtn
            self.navigationController?.pushViewController(nextVc, animated: true)
        }
    }
}

extension MovieListViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.setupWidthCell(cellMargin: cellMargin)
        let height = CGFloat(3*width/2)
        return CGSize(width: width, height: height)
    }
    
    func setupWidthCell(cellMargin : CGFloat) -> CGFloat {
        let estimatedWidth = floor(CGFloat(self.view.frame.size.width) / numberOfCells)
        let cellCount = floor(CGFloat(self.view.frame.size.width) / estimatedWidth)
        let margin = CGFloat(cellMargin * 2)
        let width = (self.view.frame.size.width - CGFloat(cellMargin) * (cellCount - 1) - margin) / cellCount
        return width
    }
}
 
extension MovieListViewController : MovieListViewModelCallback {
    func getMoviesFinished() {
        self.moviewColV.reloadData()
    }
    
    func error(message: String) {
        showAlert("Error", message: message, titleAction: "Retry", completion: {
            self.listViewModel.getMovies()
        })
    }
}
