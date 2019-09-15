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
            collectionView.delegate = self
        }
    }
    
    var viewModel: MoviesListViewModel? {
        didSet {
            viewModel?.viewDelegate = self
        }
    }
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchBar()
    }
    
    func setupSearchBar() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search movie by name"
        searchController.searchBar.tintColor = UIColor.black
        self.navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
    }
    
    func setupMovie(for cell: MovieCollectionViewCell, at index: Int) {
        let movie = viewModel?.filteredMovies?[index]
        cell.index = index
        cell.movieTitle = movie?.title
        cell.movieRating = movie?.voteAverage.description
        cell.posterUrl = ImageDownloaderHelper.getPosterUrl(with: movie?.posterPath ?? "")
        cell.isFavorite = movie?.isFavorite ?? false
        cell.delegate = self
    }
}

extension MoviesListViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.filteredMovies?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCollectionViewCell
        
        setupMovie(for: cell, at: indexPath.row)
        
        return cell
    }
}

extension MoviesListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = viewModel?.movies?[indexPath.row]
        viewModel?.showMovieDetails(movie: movie)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard !searchController.isActive else { return }
        
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offsetY > contentHeight - scrollView.frame.size.height {
            viewModel?.getMovies()
        }
    }
}

extension MoviesListViewController: MoviesListViewModelViewDelegate {
    func didSetFavorite(index: Int, isFavorite: Bool) {
        let indexPath = IndexPath(row: index, section: 0)
        let movie = viewModel?.movies?[index]
        let cell = collectionView.cellForItem(at: indexPath) as! MovieCollectionViewCell
        cell.isFavorite = movie?.isFavorite ?? false
    }
    
    func didFinishFetchMovies() {
        collectionView.reloadData()
    }
}

extension MoviesListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchTerm = searchController.searchBar.text ?? ""
        viewModel?.filterMovies(by: searchTerm)
        collectionView.reloadData()
    }
}

extension MoviesListViewController: MovieFavoriteCellDelegate {
    func didSelectMovie(at index: Int) {
        if let movie = viewModel?.movies?[index] {
            viewModel?.favoriteMovie(movie: movie, index: index)
        }
    }
}

