//
//  LYURLRequestSerialization.m
//  LYRequest
//
//  Created by 林域 on 2019/1/3.
//  Copyright © 2019 林域. All rights reserved.
//

#import "LYURLRequestSerialization.h"

@implementation LYURLRequestSerialization

-(instancetype)init{
    self = [super init];
    if (!self) { return self; }
    return self;
}

-(NSMutableURLRequest *)requestWithMethod:(NSString *)method
                                URLString:(NSString *)urlString
                               parameters:(id)parameters
                                    error:(NSError *)error{
    
    NSParameterAssert(method);
    NSParameterAssert(urlString);
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSMutableURLRequest *mutableRequest = [[NSMutableURLRequest alloc]initWithURL:url];
    mutableRequest.HTTPMethod = method;
    
    return mutableRequest;
}

@end
