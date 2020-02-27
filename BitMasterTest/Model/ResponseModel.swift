//
//  ResponseModel.swift
//  BitMasterTest
//
//  Created by Daniil on 17.02.2020.
//  Copyright © 2020 Daniil. All rights reserved.
//

import Foundation

struct Response: Decodable {
    var items: [Repository]
}

struct Repository: Decodable {
    var name: String
    var stargazers_count: Int
    
    private enum CodingKeys: CodingKey {
        case name
        case stargazers_count
    }
    
    var latitude: Double = Double.random(in: -90...90)
    var longitude: Double = Double.random(in: -180...80)
}
