//
//  RepoSearchRouter.h
//  GithubappObjC
//
//  Created by user124076 on 11.01.17.
//  Copyright © 2017 user124076. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "RepoSearchViewController.h"

@protocol RepoSearchRouterInput <NSObject>

-(void)navigateToRepoDetail;
-(void)navigateToUserDetail;
-(void)passDataToNextScene:(UIStoryboardSegue*)segue;

@end

@interface RepoSearchRouter : NSObject <RepoSearchRouterInput>

@property (nonatomic, weak) RepoSearchViewController *view;

@end
