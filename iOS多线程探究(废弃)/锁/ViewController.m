//
//  ViewController.m
//  锁
//
//  Created by linyu on 2020/8/7.
//  Copyright © 2020 林域. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    for (int i = 0; i < 100; i++) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSLog(@"i - %d",i);
        });
    }
}


@end
