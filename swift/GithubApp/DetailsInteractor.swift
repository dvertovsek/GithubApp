//
//  RepoDetailsInteractor.swift
//  GithubApp
//
//  Created by user124076 on 08.01.17.
//  Copyright © 2017 user124076. All rights reserved.
//

import Foundation

protocol DetailsInteractorOutput: class {
    func sendModel(_ model: Model)
}

protocol DetailsInteractorInput: class {
    func requestModel()
    func configureModel(_ model: Model)
}

class DetailsInteractor : DetailsInteractorInput {
   
    weak var presenter: DetailsInteractorOutput!
    
    var model: Model?
    
    func configureModel(_ model: Model) {
        self.model = model
    }
    
    func requestModel() {
        self.presenter.sendModel(model!)
        
    }
}
