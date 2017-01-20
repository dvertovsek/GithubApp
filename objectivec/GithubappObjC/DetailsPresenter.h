//
//  DetailsPresenter.h
//  GithubappObjC
//
//  Created by user124076 on 11.01.17.
//  Copyright © 2017 user124076. All rights reserved.
//

#import "DetailsInteractor.h"
#import "DetailsViewController.h"
#import "DetailsRouter.h"

@interface DetailsPresenter : NSObject <DetailsInteractorOutput, DetailsViewControllerOutput>

@property (nonatomic) id<DetailsInteractorInput> interactor;
@property (nonatomic) id<DetailsRouterInput> router;
@property (nonatomic) id<DetailsViewControllerInput> view;

@end
