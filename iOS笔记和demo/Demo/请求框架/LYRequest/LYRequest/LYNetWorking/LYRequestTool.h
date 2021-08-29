//
//  LYRequestTool.h
//  LYRequest
//
//  Created by 林域 on 2018/12/10.
//  Copyright © 2018 林域. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    LYREQUEST_GET,
    LYREQUEST_POST,
    LYREQUEST_UPLOAD,
    LYREQUEST_DOWNLOAD,
} LYRequestMethod;

typedef void(^SuccessBlock)(id responseObject);
typedef void(^FailureBlock)(NSError *error);

@interface LYRequestTool : NSObject

+ (instancetype)sharedInstance;

+(void)GetWithUrl:(NSString *)url
           params:(NSDictionary *)params
         progress:(float)progress
          success:(SuccessBlock)successCallBack
             fail:(FailureBlock)failCallBack;



@end
