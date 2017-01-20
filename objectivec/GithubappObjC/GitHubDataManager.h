//
//  GithubAPIManager.h
//  GithubappObjC
//
//  Created by user124076 on 05.01.17.
//  Copyright © 2017 user124076. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RepoSearchProtocol <NSObject>

@required
- (void)fetchReposForSearchQuery:(NSString *)query withSortMethod:(NSString *)sortMethod completion:(void (^)(NSArray *repoArray,NSError *error))completionBlock;

@end

@interface GitHubDataManager : NSObject <RepoSearchProtocol>


@end


