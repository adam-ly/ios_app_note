//
//  LYHTTPSessionManager.h
//  LYRequest
//
//  Created by 林域 on 2019/1/2.
//  Copyright © 2019 林域. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LYURLSessionManager.h"
#import "LYURLRequestSerialization.h"
#import "LYURLResponseSerialization.h"
NS_ASSUME_NONNULL_BEGIN


//该类是api类,所有实现细节都不在这里

@interface LYHTTPSessionManager : LYURLSessionManager <NSCopying>

#pragma mark - init -
//
@property (nonatomic, strong)LYURLRequestSerialization *requestSerialization;

@property (nonatomic, strong)LYURLResponseSerialization *responseSerialization;

+ (instancetype)manager;

- (instancetype)initWithBaseUrl:(nullable NSURL *)url;

- (instancetype)initWithBaseURL:(nullable NSURL *)url
           sessionConfiguration:(nullable NSURLSessionConfiguration *)configuration NS_DESIGNATED_INITIALIZER;

#pragma mark - method -
-(nullable NSURLSessionDataTask*)GET:(NSString *)URLString
                          parameters:(nullable id)parameters
                             success:(nullable void(^)(NSURLSessionDataTask *task,id _Nullable responseObject))success
                             failure:(nullable void(^)(NSURLSessionDataTask *task,NSError *error))fail;

- (nullable NSURLSessionDataTask *)POST:(NSString *)URLString
                             parameters:(nullable id)parameters
              constructingBodyWithBlock:(nullable void (^)(void))block
                                success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                                failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure;
@end

NS_ASSUME_NONNULL_END
