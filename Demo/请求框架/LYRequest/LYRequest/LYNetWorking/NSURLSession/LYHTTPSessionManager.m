//
//  LYHTTPSessionManager.m
//  LYRequest
//
//  Created by 林域 on 2019/1/2.
//  Copyright © 2019 林域. All rights reserved.
//

#import "LYHTTPSessionManager.h"
@interface LYHTTPSessionManager()
@property (nonatomic, strong)NSURL *baseUrl;

@end

@implementation LYHTTPSessionManager

+(instancetype)manager{
    return [[[self class] alloc] initWithBaseUrl:nil];
}

-(instancetype)init{
    return [self initWithBaseUrl:nil];
}


-(instancetype)initWithBaseUrl:(NSURL *)url{
    return [self initWithBaseURL:url sessionConfiguration:nil];
}


-(instancetype)initWithBaseURL:(NSURL *)url sessionConfiguration:(NSURLSessionConfiguration *)configuration{
    self = [super initWithConfiguration:configuration];
    if (!self) { return nil; }
    if ([url path].length > 0 && ![[url absoluteString] hasSuffix:@"/"]) {
        url = [url URLByAppendingPathComponent:@""];
    }
    self.baseUrl = url;
    return self;
}

#pragma - mark
-(NSURLSessionDataTask *)GET:(NSString *)URLString
                  parameters:(id)parameters
                     success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
                     failure:(void (^)(NSURLSessionDataTask * _Nonnull, NSError * _Nonnull))fail{
    return [self GET:URLString parameters:parameters progress:nil success:success failure:fail];
}

-(NSURLSessionDataTask *)GET:(NSString *)URLString
                  parameters:(id)parameters
                    progress:(void (^)(NSProgress * _Nullable))downloadProgress
                     success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
                     failure:(void (^)(NSURLSessionDataTask * _Nonnull, NSError * _Nonnull))fail{
    NSURLSessionDataTask *dataTask = [self dataTaskWithHTTPMethod:@"GET"
                                                        URLString:URLString
                                                       parameters:parameters
                                                   uploadProgress:nil
                                                 downloadProgress:downloadProgress
                                                          success:success
                                                          failure:fail];
    [dataTask resume];
    return dataTask;
}

- (NSURLSessionDataTask *)dataTaskWithHTTPMethod:(NSString *)method
                                       URLString:(NSString *)URLString
                                      parameters:(id)parameters
                                  uploadProgress:(nullable void (^)(NSProgress *uploadProgress)) uploadProgress
                                downloadProgress:(nullable void (^)(NSProgress *downloadProgress)) downloadProgress
                                         success:(void (^)(NSURLSessionDataTask *, id))success
                                         failure:(void (^)(NSURLSessionDataTask *, NSError *))failure{
    
    NSError *serializationError = nil;
//    NSMutableURLRequest *request = []
    
    NSURLSessionDataTask *task;
    
    
    [task resume];
    return task;
}

- (nullable NSURLSessionDataTask *)POST:(NSString *)URLString
                             parameters:(nullable id)parameters
              constructingBodyWithBlock:(nullable void (^)())block
                                success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                                failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure {
    NSURLSessionDataTask *task;
    
    [task resume];
    return task;
}


@end
