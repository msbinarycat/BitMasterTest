//
//  DependencyContainer.swift
//  BitMasterTest
//
//  Created by Daniil on 20.02.2020.
//  Copyright © 2020 Daniil. All rights reserved.
//

import Foundation

struct DependencyContainer {
    let apiManager: APIManager
    
    init() {
        self.apiManager = APIManager()
    }
}
