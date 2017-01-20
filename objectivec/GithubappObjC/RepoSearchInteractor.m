//
//  RepoSearchInteractor.m
//  GithubappObjC
//
//  Created by user124076 on 10.01.17.
//  Copyright © 2017 user124076. All rights reserved.
//
#import "RepoSearchInteractor.h"

@interface RepoSearchInteractor () 

@end

@implementation RepoSearchInteractor

- (void) fetchAllReposFromDataManager:(NSString *)query withSortMethod:(NSString *)sortMethod{

    [[self APIManager]fetchReposForSearchQuery:query withSortMethod:sortMethod completion:^(NSArray *repoArray,NSError *error){
        if(repoArray != nil){
            [[self presenter]provideRepos:repoArray];
        } else if (error != nil){
            [[self presenter]serviceError:error];
        }
        
    }];

}


@end

