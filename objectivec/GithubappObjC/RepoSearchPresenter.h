//
//  RepoSearchPresenter.h
//  GithubappObjC
//
//  Created by user124076 on 10.01.17.
//  Copyright © 2017 user124076. All rights reserved.
//

#import "RepoSearchInteractor.h"
#import "RepoSearchViewController.h"
#import "RepoSearchRouter.h"

@interface RepoSearchPresenter : NSObject <RepoSearchInteractorOutput, RepoSearchViewControllerOutput>

@property (nonatomic) id<RepoSearchInteractorInput> interactor;
@property (nonatomic) id<RepoSearchRouterInput> router;
@property (nonatomic) id<RepoSearchViewControllerInput> view;

@end
