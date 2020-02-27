//
//  CellView.swift
//  BitMasterTest
//
//  Created by Daniil on 17.02.2020.
//  Copyright © 2020 Daniil. All rights reserved.
//

import UIKit

protocol CellDelegate {
    func didPressOnMapButton(_ cell: CellView)
}

class CellView: UITableViewCell {
    
    var delegate: CellDelegate!
    
    // MARK: - @IBOutlets
    @IBOutlet weak var repositoryName: UILabel!
    @IBOutlet weak var starGazersCount: UILabel!
    @IBOutlet weak var onMapButton: UIButton!
    
    weak var viewModel: CellViewModel? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            
            repositoryName.text = viewModel.name
            starGazersCount.text = viewModel.starGazersCount
        }
    }
    
    @IBAction func onMapButtonTapped(_ sender: UIButton) {
        delegate.didPressOnMapButton(self)
    }
    
}
