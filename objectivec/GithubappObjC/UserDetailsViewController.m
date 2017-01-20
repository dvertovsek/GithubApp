//
//  UserDetailsViewController.m
//  GithubappObjC
//
//  Created by user124076 on 11.01.17.
//  Copyright © 2017 user124076. All rights reserved.
//

#import "DetailsViewController.h"

@implementation UserDetailsViewController

-(void) awakeFromNib{
    [super awakeFromNib];

    [DetailsAssembly configure:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[self presenter]requestModel];
    
}

-(void)addModel:(NSDictionary *)user{
    
    self.title = user[@"login"];
    
    [self.userImageView sd_setImageWithURL:[NSURL URLWithString:user[@"avatar_url"]]
                               placeholderImage:[UIImage imageNamed:@"placeholder-user"]];
    
    self.userNameLabel.text = user[@"login"];
    self.userTypeLabel.text = user[@"type"];
    
    self.detailsURLLabel.text = user[@"html_url"];
    [self.detailsURLLabel setUserInteractionEnabled:true];
    
    UITapGestureRecognizer *tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedOnURL:)];
    tapped.numberOfTapsRequired = 1;
    [self.detailsURLLabel addGestureRecognizer:tapped];
    
}

-(void)tappedOnURL:(UITapGestureRecognizer *)sender{
    UILabel *touchedLabel = (UILabel *)sender.view;
    [self.presenter openWebPage:touchedLabel.text];
}

@end
