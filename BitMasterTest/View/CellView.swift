//
//  CellView.swift
//  BitMasterTest
//
//  Created by Daniil on 17.02.2020.
//  Copyright © 2020 Daniil. All rights reserved.
//

import UIKit

protocol CellDelegate {
    func didPressOnMapButton(button: UIButton)
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
            onMapButton.addTarget(self, action: #selector(pushMap(_ :)), for: .touchUpInside)
        }
    }
    
    @IBAction func onMapButtonTapped(_ sender: UIButton) {
        
    }
    
    @objc func pushMap(_ sender: UIButton) {
        delegate.didPressOnMapButton(button: sender)
    }
    
}
