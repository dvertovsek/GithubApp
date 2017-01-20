//
//  RepoDetailsRouting.swift
//  GithubApp
//
//  Created by user124076 on 08.01.17.
//  Copyright © 2017 user124076. All rights reserved.
//

import UIKit

protocol DetailsRouterInput: class{
    func openWebPage(urlString : String)
}

class DetailsRouting: DetailsRouterInput {
    
    func openWebPage(urlString : String){
        let url = URL(string: urlString)
        UIApplication.shared.open(url!)
    }
    
}
