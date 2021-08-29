//
//  ViewController.m
//  AutoreleasePool探究
//
//  Created by linyu on 2020/7/2.
//  Copyright © 2020 linyu. All rights reserved.
//

#import "ViewController.h"
#import "TestObj.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    @autoreleasepool {
        NSLog(@"1");
         
        int i = 100;
        while (i) {
            TestObj *obj = [TestObj new];
            i -- ;
        }
        NSLog(@"2");
    }
    NSLog(@"3");
}


@end
