//
//  Extensions.swift
//  BitMasterTest
//
//  Created by Daniil on 20.02.2020.
//  Copyright © 2020 Daniil. All rights reserved.
//

import UIKit

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

extension UIViewController {
    func showAlertForError(error: String) {
        let ac = UIAlertController(title: "Error", message: "\(error)", preferredStyle: .alert)
        let acAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        ac.addAction(acAction)
        self.present(ac, animated: true, completion: nil)
    }
}
