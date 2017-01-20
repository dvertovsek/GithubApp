//
//  RepoSearchPresenter.swift
//  GithubApp
//
//  Created by user124076 on 08.01.17.
//  Copyright © 2017 user124076. All rights reserved.
//

import UIKit

class RepoSearchPresenter{

    weak var view: RepoSearchViewControllerInput!
    var interactor: RepoSearchInteractorInput!
    var router: RepoSearchRouterInput!
    
}

extension RepoSearchPresenter: RepoSearchInteractorOutput{
    func provideRepos(_ repos: [Repo]){
        
        self.view.hideWaitingView()
        self.view.displayFetchedRepos(repos)
    }
    
    func serviceError(_ error: Error){
        self.view.displayErrorView("error: \(error)")
    }
}

extension RepoSearchPresenter: RepoSearchViewControllerOutput{
    func fetchRepos(query: String, sortMethod: String){
        self.view.showWaitingView()
        self.interactor.fetchAllReposFromDataManager(query, sortMethod: sortMethod)
    }
    
    func gotoRepoDetailScreen(){
        self.router.navigateToRepoDetail()
    }
    
    func gotoUserDetailScreen() {
        self.router.navigateToUserDetail()
    }
    
    func passDataToNextScene(_ segue: UIStoryboardSegue){
        self.router.passDataToNextScene(segue)
    }
}
