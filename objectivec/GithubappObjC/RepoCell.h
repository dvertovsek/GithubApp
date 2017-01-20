//
//  RepoCell.h
//  GithubappObjC
//
//  Created by user124076 on 10.01.17.
//  Copyright © 2017 user124076. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RepoCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView *userThumbImageView;
@property (nonatomic, weak) IBOutlet UILabel *userNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *forkNoLabel;
@property (nonatomic, weak) IBOutlet UILabel *issueNoLabel;
@property (nonatomic, weak) IBOutlet UILabel *watcherNoLabel;
@property (nonatomic, weak) IBOutlet UILabel *repoNameLabel;


@end
