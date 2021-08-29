//
//  LYURLRequestSerialization.h
//  LYRequest
//
//  Created by 林域 on 2019/1/3.
//  Copyright © 2019 林域. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//负责处理request

@interface LYURLRequestSerialization : NSObject

-(NSMutableURLRequest *)requestWithMethod:(NSString *)method
                                URLString:(NSString *)urlString
                               parameters:(id)parameters
                                    error:(NSError *)error;

@end

NS_ASSUME_NONNULL_END
