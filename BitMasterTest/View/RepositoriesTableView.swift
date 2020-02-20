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
        cell.onMapButton.tag = indexPath.row
        cell.onMapButton.addTarget(self, action: #selector(performSegueFromButtonOnMap(_ :)), for: .touchUpInside)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @objc func performSegueFromButtonOnMap(_ sender: Any) {
        if let button = sender as? UIButton {
            let storyBoard = UIStoryboard(name: "Main", bundle:nil)
            let mapViewController = storyBoard.instantiateViewController(identifier: "MapViewController") as! MapViewController
            
            let repo = viewModel.getRepository(at: button.tag)
            
            mapViewController.camera = GMSCameraPosition.camera(withLatitude: repo.latitude, longitude: repo.longitude, zoom: 3)
            
            let marker: GMSMarker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: repo.latitude, longitude: repo.longitude)
            marker.title = "\(repo.stargazers_count)";
            mapViewController.marker = marker
            
            self.navigationController?.pushViewController(mapViewController, animated: true)
        }
    }
}

extension RepositoriesTableView: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}

extension RepositoriesTableView: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let username = searchBar.text {
            viewModel.getRepositoriesForUsername(username: username) { (result) in
                switch result {
                case .success(_):
                    DispatchQueue.main.async {
                        self.navigationItem.searchController?.isActive = false
                        self.navigationItem.searchController?.searchBar.placeholder = username
                        self.tableView.tableHeaderView = nil
                        self.tableView.reloadData()
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
    }
}

extension UITableViewController {
    func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self as? UISearchResultsUpdating
        searchController.searchBar.delegate = (self as! UISearchBarDelegate)
        searchController.searchBar.autocapitalizationType = .none
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
}
