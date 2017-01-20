//
//  DetailViewInteractor.m
//  GithubappObjC
//
//  Created by user124076 on 11.01.17.
//  Copyright © 2017 user124076. All rights reserved.
//
#import "DetailsInteractor.h"

@implementation DetailsInteractor

-(void) requestModel{
    [[self presenter] sendModel:self.model];
}

-(void)configureModel:(NSDictionary *)model{
    self.model = model;
}

@end
