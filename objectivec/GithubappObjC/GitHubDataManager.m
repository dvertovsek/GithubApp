//
//  GitHubAPIManager.m
//  GithubappObjC
//
//  Created by user124076 on 05.01.17.
//  Copyright © 2017 user124076. All rights reserved.
//

#import "GitHubDataManager.h"
#import "AFNetworking/AFNetworking.h"

@import CoreData;

@interface GitHubDataManager () 


@end

@implementation GitHubDataManager

-(void) fetchReposForSearchQuery:(NSString *)query withSortMethod:(NSString *)sortMethod completion:(void (^)(NSArray *, NSError *))completionBlock{
    
    NSDictionary *parameters = @{@"q": query, @"sort": sortMethod};
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSString *URLString = @"https://api.github.com/search/repositories";
        
    NSURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:URLString parameters:parameters error:nil];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            completionBlock(nil, error);
        } else {
            //NSArray *jsonString = [responseObject results];
            //NSString *a = responseObject[@"items"][0][@"name"];
            //NSString *jsonString2 = [NSString stringWithFormat:@"%@",responseObject];
            //Repositories* repos = [[Repositories alloc] initWith:a error:nil];
            //NSDictionary *davay = [responseObject items];
            NSArray<id<UIDynamicItem>> *repoArray = responseObject[@"items"];

            //NSString *s = [responseObject items];
            completionBlock(repoArray, nil);
        }
    }];
    [dataTask resume];
}

@end
