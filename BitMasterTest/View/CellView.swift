//
//  CellView.swift
//  BitMasterTest
//
//  Created by Daniil on 17.02.2020.
//  Copyright © 2020 Daniil. All rights reserved.
//

import UIKit

class CellView: UITableViewCell {
    
    // MARK: - @IBOutlets
    @IBOutlet weak var repositoryName: UILabel!
    @IBOutlet weak var starGazersCount: UILabel!
    
    weak var viewModel: CellViewModel? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            
            repositoryName.text = viewModel.name
            starGazersCount.text = viewModel.starGazersCount
        }
    }
    
}
