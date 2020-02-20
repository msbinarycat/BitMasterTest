//
//  CellViewModel.swift
//  BitMasterTest
//
//  Created by Daniil on 17.02.2020.
//  Copyright © 2020 Daniil. All rights reserved.
//

import Foundation

class CellViewModel {
    
    private var repository: Repository
    
    var name: String {
        return "\(repository.name)"
    }
    
    var starGazersCount: String {
        return "\(repository.stargazers_count)"
    }
    
    init(repository: Repository, buttonTag: Int) {
        self.repository = repository
    }
}
