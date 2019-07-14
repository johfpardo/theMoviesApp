//
//  MovieListViewController.swift
//  TheMoviesApp
//
//  Created by Jhon Fredy Pardo Patiño on 7/13/19.
//  Copyright © 2019 Jhon Fredy Pardo Patiño. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController {

    //Constants
    let cellWidth : CGFloat = 160.0
    let cellMargin : CGFloat = 16.0
    
    @IBOutlet weak var moviewColV: UICollectionView!
    var listViewModel : MovieListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moviewColV.delegate = self
        moviewColV.dataSource = self
        //setup cell
        let cell = moviewColV?.collectionViewLayout as! UICollectionViewFlowLayout
        cell.minimumInteritemSpacing = CGFloat(self.cellMargin)
        cell.minimumLineSpacing = CGFloat(self.cellMargin)
        
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
        if let url = URL(string: ConstantsRestApi.urlAccessPoster+self.listViewModel.movies[indexPath.row].poster_path) {
            ProcessImage.shared.downloadImage(imageView: cell.moviePoster, from: url)
        }
        return cell
    }
}

extension MovieListViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.setupWidthCell(cellWidth: cellWidth, cellMargin: cellMargin)
        return CGSize(width: width, height: width)
    }
    
    func setupWidthCell(cellWidth : CGFloat, cellMargin : CGFloat) -> CGFloat {
        let estimatedWidth = CGFloat(cellWidth)
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
}
