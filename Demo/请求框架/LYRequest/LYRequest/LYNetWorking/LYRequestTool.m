//
//  LYRequestTool.m
//  LYRequest
//
//  Created by 林域 on 2018/12/10.
//  Copyright © 2018 林域. All rights reserved.
//

/*
 *   NSURLSession: 会话,用来管理
 *   NSURLSessionTask 为抽象类
 */

#import "LYRequestTool.h"

static NSURL* EncodeUrl(NSString *url){
    NSCharacterSet *encodeUrlSet = [NSCharacterSet URLQueryAllowedCharacterSet];
    NSURL *request_url = [NSURL URLWithString:[url stringByAddingPercentEncodingWithAllowedCharacters:encodeUrlSet]];
    return request_url;
}


//独立开来写的demo
@interface LYRequestTool()<NSURLSessionDelegate>

@end
@implementation LYRequestTool

static LYRequestTool *sharedSingleton = nil;

+(void)GetWithUrl:(NSString *)url
           params:(NSDictionary *)params
         progress:(float)progress
          success:(SuccessBlock)successCallBack
             fail:(FailureBlock)failCallBack{
    NSLog(@"%s",__func__);
    
    NSURL *request_url = EncodeUrl(url);
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    configuration.timeoutIntervalForRequest = 10.0;
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:nil delegateQueue:nil];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:request_url cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:1.0];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
    }];
    [task resume];
}




#pragma mark - singleton -
+ (instancetype)sharedInstance {
    return [[self alloc] init];
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
    if (!sharedSingleton) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            sharedSingleton = [super allocWithZone:zone];
        });
    }
    return sharedSingleton;
}

- (id)init
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedSingleton = [super init];
    });
    return sharedSingleton;
}

+ (id)copyWithZone:(struct _NSZone *)zone
{
    return sharedSingleton;
}
+ (id)mutableCopyWithZone:(struct _NSZone *)zone
{
    return sharedSingleton;
}



@end
