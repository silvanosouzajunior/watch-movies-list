//
//  MoviesListViewController.swift
//  WatchList
//
//  Created by Silvano de Souza Junior on 14/09/19.
//  Copyright © 2019 SilvanoJunior. All rights reserved.
//

import UIKit

class MoviesListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.dataSource = self
        }
    }
    
    var viewModel: MoviesListViewModel? {
        didSet {
            viewModel?.viewDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.getMovies(by: 1)
    }
    
    func setMoviePoster(for cell: MovieCollectionViewCell, at index: Int) {
        let movie = viewModel?.movies?[index]
        cell.posterUrl = viewModel?.getPosterUrl(with: movie!)
    }
}

extension MoviesListViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.movies?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCollectionViewCell
        
        setMoviePoster(for: cell, at: indexPath.row)
        
        return cell
    }
}

extension MoviesListViewController: MoviesListViewModelViewDelegate {
    func didFinishFetchMovies() {
        collectionView.reloadData()
    }
}
