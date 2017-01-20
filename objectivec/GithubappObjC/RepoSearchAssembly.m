//
//  RepoSearchAssembly.m
//  GithubappObjC
//
//  Created by user124076 on 10.01.17.
//  Copyright © 2017 user124076. All rights reserved.
//

#import "RepoSearchAssembly.h"
#import "GitHubDataManager.h"
#import "RepoSearchInteractor.h"
#import "RepoSearchPresenter.h"

@implementation RepoSearchAssembly

+(void) configure:(RepoSearchViewController *)viewController{
    
    GitHubDataManager *githubDataManager = [[GitHubDataManager alloc]init];
    RepoSearchInteractor *interactor = [[RepoSearchInteractor alloc]init];
    RepoSearchPresenter *presenter = [[RepoSearchPresenter alloc]init];
    RepoSearchRouter *router = [[RepoSearchRouter alloc]init];
    
    router.view = viewController;
    presenter.router = router;
    
    presenter.view = viewController;
    presenter.interactor = interactor;
    
    viewController.presenter = presenter;
    
    interactor.presenter = presenter;
    interactor.APIManager = githubDataManager;
}

@end
