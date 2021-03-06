//
//  RepositoriesTableViewModel.swift
//  BitMasterTest
//
//  Created by Daniil on 17.02.2020.
//  Copyright © 2020 Daniil. All rights reserved.
//

import Foundation

class RepositoriesTableViewModel {
    
    private var repositoriesList: [Repository] = []
    private let apiManager: APIManager
    
    init(dependency: DependencyContainer) {
        self.apiManager = dependency.apiManager
    }
    
    func numberOfRowsInSection() -> Int? {
        return repositoriesList.count
    }
    
    func cellViewModel(for indexPath: IndexPath) -> CellViewModel {
        let repositoryForIndexPath = repositoriesList[indexPath.row]
        
        return CellViewModel(repository: repositoryForIndexPath)
    }
    
    func getRepositoriesForUsername(userString: String, completionHandler: @escaping (Result<String, Error>) -> ()) {
        apiManager.getRepositoriesList(for: userString) { (result) in
            switch result {
            case .success(let reposList):
                DispatchQueue.main.async {
                    self.repositoriesList = reposList.sorted(by: { $0.stargazers_count > $1.stargazers_count })
                    completionHandler(.success("Success"))
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    completionHandler(.failure(error))
                }
            }
        }
    }
    
    func getRepository(at index: Int) -> Repository {
        return repositoriesList[index]
    }
}
