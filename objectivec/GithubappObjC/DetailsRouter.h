//
//  DetailsRouter.h
//  GithubappObjC
//
//  Created by user124076 on 11.01.17.
//  Copyright © 2017 user124076. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DetailsRouterInput <NSObject>

- (void)openWebPage:(NSString *)url;

@end

@interface DetailsRouter : NSObject <DetailsRouterInput>

@end
