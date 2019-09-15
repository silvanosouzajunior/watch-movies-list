//
//  UserMoviesTableViewController.swift
//  WatchList
//
//  Created by Silvano de Souza Junior on 15/09/19.
//  Copyright © 2019 SilvanoJunior. All rights reserved.
//

import UIKit

class UserMoviesTableViewController: UITableViewController {

    var viewModel: UserMoviesViewModel?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        title = viewModel?.getNavigationTitle()
        viewModel?.getFavoriteMovies()
        tableView.reloadData()
    }
    
    func setupMovie(for cell: UserMovieTableViewCell, at index: Int) {
        let movie = viewModel?.movies?[index]
        cell.movieTitle = movie?.title
        cell.releaseDate = movie?.releaseDate
        cell.posterUrl = ImageDownloaderHelper.getPosterUrl(with: movie?.posterPath ?? "")
    }
}

extension UserMoviesTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.movies?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserMovieCell", for: indexPath) as! UserMovieTableViewCell
        
        setupMovie(for: cell, at: indexPath.row)
        
        return cell
    }
}
