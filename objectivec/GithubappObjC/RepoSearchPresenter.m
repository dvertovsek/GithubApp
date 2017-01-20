//
//  RepoSearchPresenter.m
//  GithubappObjC
//
//  Created by user124076 on 10.01.17.
//  Copyright © 2017 user124076. All rights reserved.
//

#import "RepoSearchPresenter.h"

@interface RepoSearchPresenter ()


@end

@implementation RepoSearchPresenter

-(void)fetchRepos:(NSString *)query withSortMethod:(NSString *)sortMethod{
    [[self interactor] fetchAllReposFromDataManager:query withSortMethod:sortMethod];
}

-(void)gotoUserDetailScreen{
    [[self router] navigateToUserDetail];
}

-(void)gotoRepoDetailScreen{
    [[self router] navigateToRepoDetail];
}

-(void)passDataToNextScene:(UIStoryboardSegue *)segue{
    [[self router]passDataToNextScene:segue];
}

-(void) serviceError:(NSError *)error{
    [self.view showErrorMessage:error];
}

-(void) provideRepos:(NSArray *)repos{
    [[self view]addRepos: repos];
}

@end
