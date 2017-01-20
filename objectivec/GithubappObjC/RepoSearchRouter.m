//
//  RepoSearchRouter.m
//  GithubappObjC
//
//  Created by user124076 on 11.01.17.
//  Copyright © 2017 user124076. All rights reserved.
//

#import "RepoSearchRouter.h"
#import "DetailsViewController.h"

@interface RepoSearchRouter()
@end

@implementation RepoSearchRouter

-(void)navigateToRepoDetail{
    [self.view performSegueWithIdentifier:@"ShowRepoDetailsSegue" sender:nil];
}

-(void)navigateToUserDetail{
    [[self view]performSegueWithIdentifier:@"ShowUserDetailsSegue" sender:nil];
}

-(void)passDataToNextScene:(UIStoryboardSegue *)segue{
    if ([segue.identifier  isEqual: @"ShowRepoDetailsSegue"]){
        [self passDataToShowRepoDetailScene:segue];
    } else if([segue.identifier  isEqual: @"ShowUserDetailsSegue"]) {
        [self passDataToShowUserDetailScene:segue];
    }
}

-(void)passDataToShowRepoDetailScene:(UIStoryboardSegue *)segue{

    NSInteger selectedIndex = self.view.tableView.indexPathForSelectedRow.row;
    NSDictionary *selectedRepo = self.view.repos[selectedIndex];
    
    RepoDetailsViewController *repoDetailsViewCntroller = segue.destinationViewController;
    
    [repoDetailsViewCntroller.presenter saveSelectedModel:selectedRepo];
    
}

-(void)passDataToShowUserDetailScene:(UIStoryboardSegue *)segue{
    
    NSInteger selectedIndex = self.view.selectedIndexPath;
    NSDictionary *selectedUser = self.view.repos[selectedIndex][@"owner"];
    
    UserDetailsViewController *userDetailsViewController = segue.destinationViewController;
    
    [userDetailsViewController.presenter saveSelectedModel:selectedUser];
}

@end

