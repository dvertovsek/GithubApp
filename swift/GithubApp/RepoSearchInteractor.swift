//
//  RepoSearchInteractor.swift
//  GithubApp
//
//  Created by user124076 on 08.01.17.
//  Copyright © 2017 user124076. All rights reserved.
//

import Foundation

protocol RepoSearchInteractorInput: class{
    func fetchAllReposFromDataManager(_ query: String, sortMethod: String)
}

protocol RepoSearchInteractorOutput: class{
    func provideRepos(_ repos: [Repo])
    func serviceError(_ error: Error)
}

class RepoSearchInteractor: RepoSearchInteractorInput {
    
    weak var presenter: RepoSearchInteractorOutput!
    var APIDataManager: RepoSearchProtocol!
    
    func fetchAllReposFromDataManager(_ query: String, sortMethod: String) {
        APIDataManager.fetchReposForSearchQuery(query: query, sortMethod: sortMethod){
            err,repos in
            if let reposArray = repos{
                self.presenter.provideRepos(reposArray)
            }else if let error = err{
                self.presenter.serviceError(error)
            }
        }
    }
}
