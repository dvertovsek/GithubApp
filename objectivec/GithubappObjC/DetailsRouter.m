//
//  DetailsRouter.m
//  GithubappObjC
//
//  Created by user124076 on 11.01.17.
//  Copyright © 2017 user124076. All rights reserved.
//

#import "DetailsRouter.h"

@implementation DetailsRouter

-(void)openWebPage:(NSString *)url{
    
    NSURL *URL = [NSURL URLWithString: url];
    UIApplication *application = [UIApplication sharedApplication];
    [application openURL:URL options:@{} completionHandler:nil];

}

@end
