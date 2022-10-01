//
//  ViewController.m
//  iOS多线程探究
//
//  Created by 林域 on 2018/11/15.
//  Copyright © 2018 林域. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /** 队列 ：管理线程
        串行队列 ：一次执行一条线程 按顺序逐一执行
        并发队列 ：
    */
//    [self GCD_Base1];
    
//    [self GCD_Base2];

//    [self GCD_Base3];
    
//    [self GCD_Base4];
    
//    [self GCD_Base5];
    
//    [self GCD_Base6];
    
//    [self deadLock];
    
//    [self dispatchApply];
    
//    [self suspendAndResume];
    
//    [self dispatch_semaphore];
    
//    [self dispatchIO];

    
    [self queue_specified];
}


//GCD的label获取
-(void)GCD_Info{
    //获取队列的label
    dispatch_queue_t queue = dispatch_queue_create("abc", DISPATCH_QUEUE_SERIAL);
    NSLog(@"%s", dispatch_queue_get_label(queue));
}

//
-(void)queue_specified{
    static void *mainQueueKey = "mainQueueKey";
    dispatch_queue_set_specific(dispatch_get_main_queue(), mainQueueKey, &mainQueueKey, NULL);
    
    if (dispatch_queue_get_specific(dispatch_get_main_queue(), mainQueueKey)) {
        NSLog(@"当前任务在主队列");
    }
    
    if (dispatch_get_specific(mainQueueKey)) {
        NSLog(@"当前任务在主队列");
    }
    
    
    dispatch_sync(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"111 %@",[NSThread currentThread]);
        if (dispatch_get_specific(mainQueueKey)) {
            NSLog(@"111 yes");
        }else{
            NSLog(@"111 不是在主队列");
        }
    });
    
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"222 %@",[NSThread currentThread]);
        if (dispatch_get_specific(mainQueueKey)) {
            NSLog(@"222 当前任务在主队列");
        }else{
            NSLog(@"222 不是在主队列");
        }
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@" 333 %@",[NSThread currentThread]);
        if (dispatch_get_specific(mainQueueKey)) {
            NSLog(@"333 当前任务在主队列");
        }else{
            NSLog(@"333 不是在主队列");
        }
    });
    
}

- (void)dispatchIO {
    //读取大文件，可以将文件分割并使用全局队列进行并列读取，可以提高读取速度
    // dispatch_io_t 和 dispatch_data_t
    /*
     1. type  通道类型 （Dispatch I/O Channel Types.）
     {
        #define DISPATCH_IO_STREAM 0
        读写操作按顺序依次顺序进行。在读或写开始时，操作总是在文件指针位置读或写数据。读和写操作可以在同一个信道上同时进行。
     
        #define DISPATCH_IO_RANDOM 1
        随机访问文件。读和写操作可以同时执行这种类型的通道,文件描述符必须是可寻址的。
     }
     2. fd 文件描述符
     3. queue  The dispatch queue
     4. cleanup_handler 发生错误时用来执行处理的 Block
     */
    
//    dispatch_queue_t pipe_q = dispatch_queue_create("PipeQ", NULL);
//    dispatch_queue_t pipeChannel = dispatch_io_create(DISPATCH_IO_STREAM, dispatch_fd_t fd, pipe_q, ^(int error) {
//
//    });
}

-(void)dispatch_semaphore{
    // dispatch_semaphore_t 是持有计数的信号
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
    
    NSMutableArray *arr = @[].mutableCopy;
    for (int i = 0; i < 100; i++) {
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);// 信号大于0 执行-1 等于0则等待
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [arr addObject:@(i)];
            NSLog(@"%d",i);
            dispatch_semaphore_signal(semaphore);// 释放 信号+1
        });
    }
}

-(void)suspendAndResume{
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    //挂起指定的queue
    dispatch_suspend(queue);
    //恢复指定的queue
    dispatch_resume(queue);
}

-(void)dispatchApply{
    // dispatch_apply 函数是dispatch_group 和 dispatch_sync 关联的API,该函数按指定的次数将指定的block追加到
    // 指定的Dispatch queue 中,并等待全部处理窒执行结束
    
    // 重复执行某项操作并复用Block
    // 注意串行队列和并行队列的特性
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
//    dispatch_apply(10, queue, ^(size_t index) {
//        NSLog(@"%zu",index);
//    });
//    NSLog(@"这里的打印不论如何都会在上面任务全部结束的时候打印");
    
    dispatch_async(queue, ^{
        dispatch_apply(10, queue, ^(size_t index) {
            NSLog(@"执行完第%zu个任务",index);
        });
        //上面都已经执行完毕 这里不需要再做同步操作
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"main");
        });
    });
}

//死锁
-(void)deadLock{
    //    https://www.jianshu.com/p/3684f40c9172 -> 在主线程中添加同步任务死锁的原因
    // 主队列是串行队列 只有一个线程 就是主线程。往主线程中添加同步任务 同步任务
//    dispatch_sync(dispatch_get_main_queue(), ^{
//        NSLog(@"123");
//    });
    
//    dispatch_queue_t serial_queue = dispatch_queue_create("ly_seriralQueue", DISPATCH_QUEUE_SERIAL);
//    dispatch_sync(serial_queue, ^{
//        NSLog(@"123"); // 新创建的队列里面没有其他任务 所以这里会立即执行
//        dispatch_sync(serial_queue, ^{
//            // 同个串行队列中 添加同步任务 因为队列里面有任务 所以造成互相等待。
//            NSLog(@"%d",[NSThread isMainThread]);
//        });
//    });
    
    
}

//
-(void)GCD_Base1{
    /**
     1. DISPATCH_QUEUE_SERIAL 使用1个线程 所以里面的任务是按顺序执行的
     2. 可以利用它创建多个队列（每个队列中有一个线程） 这些队列中的线程之间是并发的 切记不能创建太多
     3. 多个线程访问同一数据 最好不要使用多个serialQueue并发执行 而是利用concurrentqueue内部有效管理
     */
    
    
    /**
     1. DISPATCH_QUEUE_CONCURRENT 会在内部线程池创建多条线程
     */
    dispatch_queue_t concurrent_queue = dispatch_queue_create("ly_concurrentQueue", DISPATCH_QUEUE_CONCURRENT);
    
    
    /*
     Main Dispatch Queue
     主线程使用的queue 所以是一个serialQueue
     */
    
    /*
     Global Dispatch Queue
     1.所有应用程序都能使用的Concurrent Dispatch Queue
     2.没有必要通过dispatch_queue_create生成concurrentQueue 直接使用Globle Disptch Queue即可
     3.有4个优先级
     */
    dispatch_queue_t queueWithPriority = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
}

// dispatch_set_target_queue
- (void)GCD_Base2{
    
    //dispatch_set_target_queue()
    dispatch_queue_t serial_queue = dispatch_queue_create("serial_queue", DISPATCH_QUEUE_SERIAL);
    
    dispatch_queue_t concurrent_queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    //改变serial_queue的优先级与concurrent_queue相同
    dispatch_set_target_queue(serial_queue, concurrent_queue);
    
    dispatch_queue_t serial_queue1 = dispatch_queue_create("serial_queue1", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t serial_queue2 = dispatch_queue_create("serial_queue2", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t serial_queue3 = dispatch_queue_create("serial_queue3", DISPATCH_QUEUE_SERIAL);
    
    //如果同一个任务分成3个并行的serialqueue执行 可以用此方法 将他们同步到同一个队列中执行,如下3个不同队列中的任务,都同步到同一个串行队列中顺序执行
    dispatch_set_target_queue(serial_queue1, serial_queue);
    dispatch_set_target_queue(serial_queue2, serial_queue);
    dispatch_set_target_queue(serial_queue3, serial_queue);
    
    dispatch_async(serial_queue1, ^{
        NSLog(@"1 in ");
        [NSThread sleepForTimeInterval:3.f];
        NSLog(@"1 out ");
    });
    
    dispatch_async(serial_queue2, ^{
        NSLog(@"2 in ");
        [NSThread sleepForTimeInterval:1.f];
        NSLog(@"2 out ");
    });
    
    dispatch_async(serial_queue3, ^{
        NSLog(@"3 in ");
        [NSThread sleepForTimeInterval:2.f];
        NSLog(@"3 out ");
    });
    
    
}


-(void)GCD_Base3{
    
    // dispatch_after 是在指定时间将任务追加到Dispatch_queue 要等待上一个任务结束
    dispatch_queue_t serial_queue = dispatch_queue_create("serial_queue", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(serial_queue, ^{
        NSLog(@"1");
        [NSThread sleepForTimeInterval:4.0];
        NSLog(@"2");
    });
    
    
    // ull是C语言的数值字面量 是显示表明类型时使用的字符串（表示：usigned long long）
    /*
     #define NSEC_PER_SEC 1000000000ull
     #define NSEC_PER_MSEC 1000000ull
     #define USEC_PER_SEC 1000000ull
     #define NSEC_PER_USEC 1000ull
     */
    // dispatch_time_t 一般用于相对时间
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 1ull * NSEC_PER_SEC);
    dispatch_after(time, serial_queue, ^{
        NSLog(@"3");
    });
    
    // dispatch_walltime 通常用于计算绝对时间 比如在2011年11月11日11时11分11秒执行某个任务 类比闹钟
    getDispatchTimeByDate([NSDate date]);
}

dispatch_time_t getDispatchTimeByDate(NSDate *date){
    NSTimeInterval interval;
    double second,subsecond;
    struct timespec time;
    dispatch_time_t milestone;
    
    interval = [date timeIntervalSince1970];
    //返回小数部分 并设置second为整数部分
    subsecond = modf(interval, &second);
    time.tv_sec = second; //秒
    time.tv_nsec = subsecond * NSEC_PER_SEC; //微秒
    milestone = dispatch_walltime(&time, 0);
    return milestone;
}

// dispatch_group()
-(void)GCD_Base4{
    dispatch_queue_t queue1 = dispatch_get_global_queue(0, 0);
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, queue1, ^{
        NSLog(@"1 in");
        [NSThread sleepForTimeInterval:2.0];
        NSLog(@"1 out");
    });
    
    dispatch_group_async(group, queue1, ^{
        NSLog(@"2 in");
        [NSThread sleepForTimeInterval:1.0];
        NSLog(@"2 out");
    });
    
    dispatch_group_async(group, queue1, ^{
        NSLog(@"3 in");
        [NSThread sleepForTimeInterval:3.0];
        NSLog(@"3 out");
    });
    
    //追加到queue1中的任务全部结束后会走该回调 这里的block会被追加到mainQueue执行
//    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
//        NSLog(@"all task finished");
//    });
    
    //如果设置为 DISPATCH_TIME_FOREVER 永久等待 则返回值恒为0
    dispatch_time_t time = DISPATCH_TIME_FOREVER;
    
    //如果任务执行的时间比所设置的等待时间长 那么会返回1
//    dispatch_time_t time = 3ull * NSEC_PER_SEC;
    
    // DISPATCH_TIME_NOW 则不用任何等待判定任务是否结束
    
    long result = dispatch_group_wait(group, time);
    if (result == 0) {
        NSLog(@"group中的任务执行完毕");
    }else{
        NSLog(@"还在执行中。。。");
    }
}

// dispatch_barrier_async
-(void)GCD_Base5{
    
    dispatch_queue_t queue = dispatch_queue_create("1", DISPATCH_QUEUE_CONCURRENT);
    __block int i = 1;
    
    dispatch_async(queue, ^{ NSLog(@"1 = %d",i); });
    dispatch_async(queue, ^{ NSLog(@"2 = %d",i); });
    dispatch_async(queue, ^{ NSLog(@"3 = %d",i); });
    dispatch_async(queue, ^{ NSLog(@"4 = %d",i); });
    // dispatch_barrier_async 可以确保上面的4个任务执行完再执行下面的写入和读取
    dispatch_barrier_async(queue, ^{ ++i; NSLog(@"output i = %d",i); });
    dispatch_async(queue, ^{ NSLog(@"5 = %d",i); });
    dispatch_async(queue, ^{ NSLog(@"6 = %d",i); });
    dispatch_async(queue, ^{ NSLog(@"7 = %d",i); });
    dispatch_async(queue, ^{ NSLog(@"8 = %d",i); });
}

// dispatch_sync()
-(void)GCD_Base6{
    //主线程 Queue:com.apple.main-thred(serial) 在主队列中
//    将指定的block “同步”追加到指定的queue中（这里是main queue ） 在追加block结束之前 sync会一直等待
//     dispatch_sync(dispatch_get_main_queue(), ^{ NSLog(@"main queue"); });
    dispatch_queue_t queue = dispatch_queue_create("1", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        NSLog(@"start ");
        [NSThread sleepForTimeInterval:1.0];
        NSLog(@"end");
        dispatch_sync(queue, ^{
            NSLog(@"finish");
        });
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
