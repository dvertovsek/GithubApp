//
//  RepoSearchRouter.swift
//  GithubApp
//
//  Created by user124076 on 08.01.17.
//  Copyright © 2017 user124076. All rights reserved.
//

import UIKit

protocol RepoSearchRouterInput: class{
    func navigateToRepoDetail()
    func navigateToUserDetail()
    func passDataToNextScene(_ segue: UIStoryboardSegue)
}

class RepoSearchRouting: RepoSearchRouterInput {
    
    var viewController: RepoSearchViewController!
    
    func navigateToRepoDetail() {
        viewController.performSegue(withIdentifier: "ShowRepoDetailsSegue", sender: nil)
    }
    
    func navigateToUserDetail() {
        viewController.performSegue(withIdentifier: "ShowUserDetailsSegue", sender: nil)
    }
    
    func passDataToNextScene(_ segue: UIStoryboardSegue) {
        if segue.identifier == "ShowRepoDetailsSegue"{
            passDataToShowRepoDetailScene(segue)
        } else if segue.identifier == "ShowUserDetailsSegue" {
            passDataToShowUserDetailScene(segue)
        }
        
    }
    
    func passDataToShowRepoDetailScene(_ segue: UIStoryboardSegue){
        if let selectedIndexPath = viewController.tableView.indexPathForSelectedRow{
            let selectedRepoModel : Repo = viewController.repos[selectedIndexPath.row]
            let showDetailViewController = segue.destination as! RepoDetailsViewController
            
            showDetailViewController.presenter.saveSelectedModel(selectedRepoModel)
        }
    }
    
    func passDataToShowUserDetailScene(_ segue: UIStoryboardSegue){
        let selectedIndex = self.viewController.indexPathSelected
        let selectedRepoModel : User = viewController.repos[selectedIndex.row].user
        let showDetailViewController = segue.destination as! UserDetailsViewController
        
        showDetailViewController.presenter.saveSelectedModel(selectedRepoModel)
    }
    
}
