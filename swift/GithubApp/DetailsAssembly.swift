//
//  RepoDetailsAssembly.swift
//  GithubApp
//
//  Created by user124076 on 08.01.17.
//  Copyright © 2017 user124076. All rights reserved.
//

import Foundation

class DetailsAssembly {
    
    static let sharedInstance = DetailsAssembly()
    
    func configure(_ viewController: DetailsViewController){
        let interactor = DetailsInteractor()
        let presenter = DetailsPresenter()
        let router = DetailsRouting()
        
        presenter.router = router
        presenter.view = viewController
        presenter.interactor = interactor
        
        viewController.presenter = presenter
        
        interactor.presenter = presenter
    }
    
}

