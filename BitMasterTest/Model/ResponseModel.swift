//
//  ResponseModel.swift
//  BitMasterTest
//
//  Created by Daniil on 17.02.2020.
//  Copyright © 2020 Daniil. All rights reserved.
//

import Foundation

struct ResponseDescription: Decodable {
    var response: [Repository]
}

struct Repository: Decodable {
    var name: String
    var stargazers_count: Int
}
