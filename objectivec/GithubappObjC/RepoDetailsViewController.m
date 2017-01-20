//
//  RepoDetailsViewController.m
//  GithubappObjC
//
//  Created by user124076 on 12.01.17.
//  Copyright © 2017 user124076. All rights reserved.
//

#import "DetailsViewController.h"

@implementation RepoDetailsViewController

-(void) awakeFromNib{
    [super awakeFromNib];
    
    [DetailsAssembly configure:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[self presenter]requestModel];
    
}

-(void)addModel:(NSDictionary *)repo{
    
    self.repoNameLabel.text = repo[@"name"];
    self.watchersNoLabel.text = [NSString stringWithFormat:@"%@ %@", repo[@"watchers_count"], @"watchers"];
    self.forksNoLabel.text = [NSString stringWithFormat:@"%@ %@", repo[@"forks_count"], @"forks"];
    self.issuesNoLabel.text = [NSString stringWithFormat:@"%@ %@", repo[@"open_issues"], @"issues"];

    self.starNoLabel.text = [NSString stringWithFormat:@"%@", repo[@"stargazers_count"]];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";
    NSDate *dateUpdated = [dateFormatter dateFromString:repo[@"pushed_at"]];
    NSDate *dateCreated = [dateFormatter dateFromString:repo[@"created_at"]];
    
    dateFormatter.dateFormat = @"dd-MM-yyyy, hh:mm:ss";
    self.createdAtLabel.text = [dateFormatter stringFromDate:dateCreated];
    self.updatedAtLabel.text = [dateFormatter stringFromDate:dateUpdated];
    
    self.progLangLabel.text = repo[@"language"];
    
    self.detailsURLLabel.text = repo[@"html_url"];
    [self.detailsURLLabel setUserInteractionEnabled:true];
    
    UITapGestureRecognizer *tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedOnURL:)];
    tapped.numberOfTapsRequired = 1;
    [self.detailsURLLabel addGestureRecognizer:tapped];
    
    [self.authorImageView sd_setImageWithURL:[NSURL URLWithString:repo[@"owner"][@"avatar_url"]]
                          placeholderImage:[UIImage imageNamed:@"placeholder-user"]];
    
    self.authorInfoLabel.text = [NSString stringWithFormat:@"%@, %@", repo[@"owner"][@"login"], repo[@"owner"][@"type"]];
}

-(void)tappedOnURL:(UITapGestureRecognizer *)sender{
    UILabel *touchedLabel = (UILabel *)sender.view;
    [self.presenter openWebPage:touchedLabel.text];
}

@end
