//
//  ViewController.m
//  NSOperation
//
//  Created by linyu on 2020/5/4.
//  Copyright © 2020 林域. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end
@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self method_1];
}

#pragma mark ---------- 简单使用operation ----------
-(void)method_1{
    // NSOperation是一个抽象类 要用它的子类 或者自己实现一个子类来使用
    // 操作是在当前线程执行的 并没有开启新线程
    NSInvocationOperation *incovation_operation = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(testMethodA) object:nil];
    [incovation_operation start];
    
    
    NSBlockOperation *block_operation = [NSBlockOperation blockOperationWithBlock:^{
        for (int i = 0; i < 10; i++) {
            sleep(1);
            NSLog(@"block -- %d current thread - %@",i,[NSThread currentThread]);
        }
    }];
    
    //⚠️ 如果添加的操作过多 addExecutionBlock和blockOperationWithBlock中的任务
    //   可能会被系统自动分配到多个线程中执行
    for (int i = 0; i < 10; i++) {
        [block_operation addExecutionBlock:^{
            for (int i = 0; i < 10; i++) {
                sleep(1);
                NSLog(@"block -- %d current thread - %@",i,[NSThread currentThread]);
            }
        }];
    }
    [block_operation start];
}

#pragma mark ---------- <##> ----------

#pragma mark ---------- <##> ----------

#pragma mark ---------- <##> ----------


#pragma mark - test method -
-(void)testMethodA{
    for (int i = 0; i < 10; i++) {
        sleep(1);
        NSLog(@"testMethodA -- %d current thread - %@",i,[NSThread currentThread]);
    }
}

-(void)testMethodB{
    NSLog(@"testMethodB -- current thread - %@",[NSThread currentThread]);
}
@end
