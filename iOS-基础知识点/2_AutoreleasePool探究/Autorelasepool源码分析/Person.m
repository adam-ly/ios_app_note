//
//  Person.m
//  Autorelasepool源码分析
//
//  Created by linyu on 2020/7/9.
//  Copyright © 2020 linyu. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void)dealloc{
    NSLog(@"dealloc");
    [super dealloc];
}

@end
