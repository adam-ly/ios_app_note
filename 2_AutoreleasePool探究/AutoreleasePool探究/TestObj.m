//
//  TestObj.m
//  AutoreleasePool探究
//
//  Created by linyu on 2020/7/2.
//  Copyright © 2020 linyu. All rights reserved.
//

#import "TestObj.h"

@implementation TestObj
static int i = 0;
-(void)dealloc{
    NSLog(@"dealloc %d",i++);
}
@end
