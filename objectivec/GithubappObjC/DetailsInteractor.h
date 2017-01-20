//
//  DetailViewInteractor.h
//  GithubappObjC
//
//  Created by user124076 on 11.01.17.
//  Copyright © 2017 user124076. All rights reserved.
//
#import <Foundation/Foundation.h>

@protocol DetailsInteractorOutput <NSObject>

- (void)sendModel:(NSDictionary *)model;

@end

@protocol DetailsInteractorInput <NSObject>

- (void)requestModel;
- (void)configureModel:(NSDictionary *)model;

@end

@interface DetailsInteractor : NSObject <DetailsInteractorInput>

@property (nonatomic) id<DetailsInteractorOutput> presenter;
@property (nonatomic) NSDictionary *model;

@end

