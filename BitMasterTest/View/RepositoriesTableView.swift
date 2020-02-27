//
//  RepositoriesTableView.swift
//  BitMasterTest
//
//  Created by Daniil on 17.02.2020.
//  Copyright © 2020 Daniil. All rights reserved.
//

import UIKit
import GoogleMaps

class RepositoriesTableView: UITableViewController {
    
    var viewModel: RepositoriesTableViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Repositories List"
        setupNavigationBar()
        self.definesPresentationContext = true
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CellView
        
        cell.viewModel = viewModel.cellViewModel(for: indexPath)
        cell.delegate = self
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension RepositoriesTableView: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}

extension RepositoriesTableView: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let username = searchBar.text {
            viewModel.getRepositoriesForUsername(userString: username) { (result) in
                switch result {
                case .success(_):
                    DispatchQueue.main.async {
                        self.navigationItem.searchController?.isActive = false
                        self.navigationItem.searchController?.searchBar.text = username
                        self.tableView.tableHeaderView = nil
                        self.tableView.reloadData()
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.navigationItem.searchController?.isActive = false
                        self.tableView.tableHeaderView = nil
                        self.showAlertForError(error: "\(error.localizedDescription)")
                    }
                }
            }
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
    }
}

extension RepositoriesTableView: CellDelegate {
    func didPressOnMapButton(_ cell: CellView) {
        if let indexPath = self.tableView.indexPath(for: cell) {
            let storyBoard = UIStoryboard(name: "Main", bundle:nil)
            let mapViewController = storyBoard.instantiateViewController(identifier: "MapViewController") as! MapViewController
            
            let repo = viewModel.getRepository(at: indexPath.row)
            
            mapViewController.latitude = repo.latitude
            mapViewController.longitude = repo.longitude
            mapViewController.markerTitle = "\(repo.stargazers_count)"
            
            self.navigationController?.pushViewController(mapViewController, animated: true)
        }
    }
}
