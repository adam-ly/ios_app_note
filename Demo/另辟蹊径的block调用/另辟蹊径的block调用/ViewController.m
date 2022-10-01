//
//  ViewController.m
//  另辟蹊径的block调用
//
//  Created by 秦琦 on 2017/10/20.
//  Copyright © 2017年 秦琦. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

/**
 如果禁止直接调用：block();
 那能否找到2个以上另辟蹊径的方式让block被调用
 void(^block)() = ^{
     NSLog(@“block get called”);
 };
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    dispatch_block_t block = ^{
        NSLog(@"block get called");
    };
    
    [self blockProblemAnswer0:block];
    [self blockProblemAnswer1:block];
    [self blockProblemAnswer2:block];
    [self blockProblemAnswer3:block];
    [self blockProblemAnswer4:block];
    [self blockProblemAnswer5:block];
    [self blockProblemAnswer6:block];
}

- (void)blockProblemAnswer0:(dispatch_block_t)block {
    [UIView animateWithDuration:0 animations:block];
    //或者
    dispatch_async(dispatch_get_main_queue(), block);
}

- (void)blockProblemAnswer1:(dispatch_block_t)block {
    [[NSBlockOperation blockOperationWithBlock:block] start];
}

- (void)blockProblemAnswer2:(dispatch_block_t)block {
    [[NSInvocation invocationWithMethodSignature:[NSMethodSignature signatureWithObjCTypes:"v@?"]] invokeWithTarget:block];
}

- (void)blockProblemAnswer3:(dispatch_block_t)block {
    [block invoke];
}

- (void)blockProblemAnswer4:(dispatch_block_t)block {
//    struct Block_layout {
//        void *isa;
//        volatile int32_t flags; // contains ref count
//        int32_t reserved;
//        void (*invoke)(void *, ...);
//        struct Block_descriptor_1 *descriptor;
//        // imported variables
//    };
    void *pBlock = (__bridge void *)block;
    void (*invoke)(void *, ...) = *((void **)pBlock + 2);
    invoke(pBlock);
}

static void blockCleanUp(__strong void(^*block)(void)) {
    (*block)();
}

- (void)blockProblemAnswer5:(dispatch_block_t)block {
    __strong void(^cleaner)(void) __attribute__((cleanup(blockCleanUp), unused)) = block;
}

- (void)blockProblemAnswer6:(dispatch_block_t)block {
    //lldb调试命令：dis
    asm("callq *0x10(%rax)");
}


@end
