//
//  TableViewController.h
//  GithubappObjC
//
//  Created by user124076 on 05.01.17.
//  Copyright © 2017 user124076. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "GitHubDataManager.h"
#import "RepoCell.h"
#import "RepoSearchAssembly.h"

@protocol RepoSearchViewControllerInput <NSObject>

-(void)addRepos:(NSArray *)repos;
-(void)showErrorMessage:(NSError *)repos;

@end

@protocol RepoSearchViewControllerOutput <NSObject>

-(void)fetchRepos:(NSString *)query withSortMethod:(NSString *)sortMethod;
-(void)gotoUserDetailScreen;
-(void)gotoRepoDetailScreen;
-(void)passDataToNextScene:(UIStoryboardSegue*)segue;

@end

@interface RepoSearchViewController : UITableViewController <RepoSearchViewControllerInput>

@property (nonatomic) UISearchController *searchController;
@property (nonatomic) id<RepoSearchViewControllerOutput> presenter;
@property (nonatomic) NSArray* repos;
@property (nonatomic) NSString* selectedSortMethod;
@property (nonatomic) NSInteger selectedIndexPath;

@end
