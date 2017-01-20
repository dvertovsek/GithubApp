//
//  DetailsViewController.swift
//  GithubApp
//
//  Created by user124076 on 08.01.17.
//  Copyright © 2017 user124076. All rights reserved.
//

import Foundation

protocol DetailsViewControllerOutput: class{
    func saveSelectedModel(_ model: Model)
    func requestModel()
    func openWebPage(url : String)
}

protocol DetailsViewControllerInput: class{
    func addModel(_ model: Model)
}

protocol DetailsViewController:class, DetailsViewControllerInput {
    var presenter: DetailsViewControllerOutput{get set}
}


