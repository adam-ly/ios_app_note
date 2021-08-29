//
//  ViewController.m
//  GCD_DispatchSource
//
//  Created by linyu on 2020/8/8.
//  Copyright © 2020 林域. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /** Dispatch_Source介绍:
     1、dispatch_source_t : 是BSD系统内核惯有功能kqueue的封装
     2、kqueue : 是在UNX内核中发生各种事件时,在应用程序编程方执行处理的技术,其CPU负荷非常小,尽量不占用资源
     */
            
    /** dispatch_source种类:
     1、DISPATCH_SOURCE_TYPE_DATA_ADD : 变量增加
     2、DISPATCH_SOURCE_TYPE_DATA_OR : 变量OR
     3、DISPATCH_SOURCE_TYPE_MACH_SEND : Mach端口发送
     4、DISPATCH_SOURCE_TYPE_MACH_RECV : Mach端口接收
     5、DISPATCH_SOURCE_TYPE_PROC : 检测到与进程相关的事件
     6、DISPATCH_SOURCE_TYPE_READ : 可读取文件映像
     7、DISPATCH_SOURCE_TYPE_SIGNAL : 接收信号
     8、DISPATCH_SOURCE_TYPE_TIMER : 定时器
     9、DISPATCH_SOURCE_TYPE_VNODE : 文件系统有变更
     10、DISPATCH_SOURCE_TYPE_WRITE : 可写入文件映像
     */
    [self dispatch_source_timer];
}

-(void)dispatch_source_timer{
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    //15秒后开始 不重复 允许延迟1秒
    dispatch_source_set_timer(timer, dispatch_time(DISPATCH_TIME_NOW, 3ull * NSEC_PER_SEC), DISPATCH_TIME_FOREVER, 1ull * NSEC_PER_SEC);
    
    dispatch_source_set_event_handler(timer, ^{
        NSLog(@"wake up");
    });
    
    dispatch_source_set_cancel_handler(timer, ^{
        NSLog(@"cancle");
    });
    
    dispatch_resume(timer);
}

@end
