//
//  DetailsPresenter.m
//  GithubappObjC
//
//  Created by user124076 on 11.01.17.
//  Copyright © 2017 user124076. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DetailsPresenter.h"

@implementation DetailsPresenter

-(void) saveSelectedModel:(NSDictionary *)model{

    [self.interactor configureModel:model];
}

-(void) requestModel{
    [self.interactor requestModel];
}

-(void) sendModel:(NSDictionary *)model{
    [self.view addModel:model];
}

-(void) openWebPage:(NSString *)url{
    [self.router openWebPage:url];
}

@end
