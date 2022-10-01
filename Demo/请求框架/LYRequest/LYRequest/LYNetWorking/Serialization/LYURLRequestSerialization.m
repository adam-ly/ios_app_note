//
//  LYURLRequestSerialization.m
//  LYRequest
//
//  Created by 林域 on 2019/1/3.
//  Copyright © 2019 林域. All rights reserved.
//

#import "LYURLRequestSerialization.h"

static NSArray * LYHTTPRequestSearializerObserveKeyPaths(){
    static NSArray *_LYHTTPRequestSearializerObserveKeyPaths;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _LYHTTPRequestSearializerObserveKeyPaths = @[                                                     NSStringFromSelector(@selector(allowsCellularAccess)),
            NSStringFromSelector(@selector(cachePolicy)),
            NSStringFromSelector(@selector(HTTPShouldSetCookies)),
            NSStringFromSelector(@selector(HTTPShouldUsePipelining)),
            NSStringFromSelector(@selector(networkServiceType)),
            NSStringFromSelector(@selector(timeoutIntervalForRequest)),
        ];
    });
    return _LYHTTPRequestSearializerObserveKeyPaths;
}

@interface LYURLRequestSerialization ()
@property (readwrite, nonatomic, strong) NSMutableSet *mutableObservedChangedKeyPaths;
@property (readwrite, nonatomic, strong) NSMutableDictionary *mutableHTTPRequestHeaders;
@property (readwrite, nonatomic, strong) dispatch_queue_t requestHeaderModificationQueue;

@end

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
    NSParameterAssert(url);
    
    NSMutableURLRequest *mutableRequest = [[NSMutableURLRequest alloc]initWithURL:url];
    mutableRequest.HTTPMethod = method;
    
    for (NSString *keyPath in LYHTTPRequestSearializerObserveKeyPaths()) {
        
    }
    
    return mutableRequest;
}

@end
