//
//  APIManager.swift
//  BitMasterTest
//
//  Created by Daniil on 17.02.2020.
//  Copyright © 2020 Daniil. All rights reserved.
//

import Foundation

class APIManager {
    
    private let session = URLSession.shared
    private let defaultUrlString = "https://api.github.com/search/repositories?q="
    
    func getRepositoriesList(for userString: String, completionHandler: @escaping (Result<[Repository], Error>) -> ()) {
        let urlStringForUsername = defaultUrlString + "\(userString)"
        guard let url = URL(string:  urlStringForUsername) else { return }
        
        session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                DispatchQueue.main.async {
                    completionHandler(.failure(error))
                }
            }
            
            guard let data = data else { return }
            
            do {
                let decodedData = try JSONDecoder().decode(Response.self, from: data)
                DispatchQueue.main.async {
                    completionHandler(.success(decodedData.items))
                }
            } catch {
                DispatchQueue.main.async {
                    completionHandler(.failure(error))
                }
            }
        }.resume()
    }
}
