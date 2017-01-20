//
//  DetailsViewController.h
//  GithubappObjC
//
//  Created by user124076 on 11.01.17.
//  Copyright © 2017 user124076. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "DetailsAssembly.h"

@protocol DetailsViewControllerInput <NSObject>

-(void)addModel:(NSDictionary *)model;

@end

@protocol DetailsViewControllerOutput <NSObject>

-(void)saveSelectedModel:(NSDictionary *)model;
-(void)requestModel;
-(void)openWebPage:(NSString *)url;

@end

@protocol DetailsViewController <NSObject, DetailsViewControllerInput>

@property (nonatomic) id<DetailsViewControllerOutput> presenter;

@end

@interface UserDetailsViewController: UIViewController <DetailsViewController>

@property (nonatomic) id<DetailsViewControllerOutput> presenter;

@property (nonatomic, weak) IBOutlet UIImageView *userImageView;
@property (nonatomic, weak) IBOutlet UILabel *userNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *userTypeLabel;
@property (nonatomic, weak) IBOutlet UILabel *detailsURLLabel;

@end

@interface RepoDetailsViewController: UIViewController <DetailsViewController>

@property (nonatomic) id<DetailsViewControllerOutput> presenter;

@property (nonatomic, weak) IBOutlet UIImageView *authorImageView;
@property (nonatomic, weak) IBOutlet UILabel *authorInfoLabel;

@property (nonatomic, weak) IBOutlet UILabel *repoNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *starNoLabel;
@property (nonatomic, weak) IBOutlet UILabel *watchersNoLabel;
@property (nonatomic, weak) IBOutlet UILabel *forksNoLabel;
@property (nonatomic, weak) IBOutlet UILabel *issuesNoLabel;
@property (nonatomic, weak) IBOutlet UILabel *createdAtLabel;

@property (nonatomic, weak) IBOutlet UILabel *updatedAtLabel;
@property (nonatomic, weak) IBOutlet UILabel *progLangLabel;

@property (nonatomic, weak) IBOutlet UILabel *detailsURLLabel;

@end
