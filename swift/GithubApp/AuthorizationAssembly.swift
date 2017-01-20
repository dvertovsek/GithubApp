//
//  AuthorizationAssembly.swift
//  GithubApp
//
//  Created by user124076 on 09.01.17.
//  Copyright © 2017 user124076. All rights reserved.
//

import Foundation
class AuthorizationAssembly {
    
    static let sharedInstance = AuthorizationAssembly()
    
    func configure(_ viewController: AuthorizationViewController){
        let APIDataManager = GitHubDataManager()
        let interactor = AuthorizationInteractor()
        let presenter = AuthorizationPresenter()
        
        presenter.view = viewController
        presenter.interactor = interactor
        
        viewController.presenter = presenter
        
        interactor.presenter = presenter
        interactor.APIDataManager = APIDataManager
    }
    
}
