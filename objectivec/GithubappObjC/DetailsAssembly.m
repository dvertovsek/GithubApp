//
//  DetailsAssembly.m
//  GithubappObjC
//
//  Created by user124076 on 12.01.17.
//  Copyright © 2017 user124076. All rights reserved.
//

#import "DetailsAssembly.h"
#import "DetailsInteractor.h"
#import "DetailsPresenter.h"
#import "DetailsRouter.h"

@implementation DetailsAssembly

+(void) configure:(id<DetailsViewController>)viewController{

    DetailsInteractor *interactor = [[DetailsInteractor alloc]init];
    DetailsPresenter *presenter = [[DetailsPresenter alloc]init];
    DetailsRouter *router = [[DetailsRouter alloc]init];
    
    presenter.router = router;
    
    presenter.view = viewController;
    presenter.interactor = interactor;
    
    viewController.presenter = presenter;
    
    interactor.presenter = presenter;
}

@end
