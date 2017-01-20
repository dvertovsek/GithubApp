//
//  RepoDetailsPresenter.swift
//  GithubApp
//
//  Created by user124076 on 08.01.17.
//  Copyright © 2017 user124076. All rights reserved.
//

import UIKit

class DetailsPresenter: DetailsInteractorOutput, DetailsViewControllerOutput{
    
    weak var view: DetailsViewControllerInput!
    var interactor: DetailsInteractorInput!
    var router: DetailsRouterInput!
    
    func saveSelectedModel(_ model: Model){
        self.interactor.configureModel(model)
    }
    
    func requestModel() {
        self.interactor.requestModel()
    }
    
    func sendModel(_ model : Model){
        self.view.addModel(model)
    }

    internal func openWebPage(url: String) {
        self.router.openWebPage(urlString: url)
    }
    
}
