//
//  RepoSearchAssembly.swift
//  GithubApp
//
//  Created by user124076 on 08.01.17.
//  Copyright © 2017 user124076. All rights reserved.
//

import Foundation

class RepoSearchAssembly {
    
    static let sharedInstance = RepoSearchAssembly()
    
    func configure(_ viewController: RepoSearchViewController){
        let APIDataManager = GitHubDataManager()
        let interactor = RepoSearchInteractor()
        let presenter = RepoSearchPresenter()
        let router = RepoSearchRouting()
        
        router.viewController = viewController
        
        presenter.router = router
        presenter.view = viewController
        presenter.interactor = interactor
        
        viewController.presenter = presenter
        
        interactor.presenter = presenter
        interactor.APIDataManager = APIDataManager
    }

}
