//
//  RepoSearchInteractor.h
//  GithubappObjC
//
//  Created by user124076 on 10.01.17.
//  Copyright © 2017 user124076. All rights reserved.
//

#import "GitHubDataManager.h"

@protocol RepoSearchInteractorInput <NSObject>

- (void)fetchAllReposFromDataManager:(NSString *)query withSortMethod:(NSString *)sortMethod;

@end

@protocol RepoSearchInteractorOutput <NSObject>

- (void)provideRepos:(NSArray *)repos;
- (void)serviceError:(NSError *)error;

@end

@interface RepoSearchInteractor : NSObject <RepoSearchInteractorInput>

@property (nonatomic) id<RepoSearchInteractorOutput> presenter;
@property (nonatomic) id<RepoSearchProtocol> APIManager;

@end
