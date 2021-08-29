//
//  ViewController.m
//  NSThread
//
//  Created by linyu on 2020/5/4.
//  Copyright © 2020 林域. All rights reserved.
//

#import "ViewController.h"
#import "LYThread.h"
@interface ViewController ()
@property(nonatomic,strong)NSThread *thread;

@property(nonatomic,strong)NSPort *port;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self method_4];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (_thread.isExecuting) {
        //注意 cancel只是标记线程的取消状态,并不会为你退出线程,需要在当前线程的任务中自己判断当前线程是否取消
        [_thread cancel];
        NSLog(@"22 thread1  isExecuting = %d isFinished = %d isCancelled = %d",_thread.isExecuting,_thread.isFinished,_thread.isCancelled);
    }
    
    NSLog(@"33 thread1  isExecuting = %d isFinished = %d isCancelled = %d",_thread.isExecuting,_thread.isFinished,_thread.isCancelled);
}

#pragma mark - 初始化创建线程 -
/// 用init方法创建的线程需要手动操作 包括启动和取消等操作
-(void)method_1{
//    [[NSThread alloc] initWithBlock:nil];
    //创建一个线程
    _thread = [[NSThread alloc] initWithTarget:self selector:@selector(backgroundMehtod2) object:nil];
    _thread.name = @"thread_1";
    [_thread start];
}

#pragma mark - 分离主线程创建 -
/// 用detach方法创建线程后会自动执行，但是线程外部不可获取到该线程对象,类似一个《匿名类》
-(void)method_2{
//    [NSThread detachNewThreadSelector: toTarget: withObject:]
    [NSThread detachNewThreadWithBlock:^{
        //这个方法创建的thread 不可以被获取 会自动启动和销毁 不受控制
        NSLog(@"backgroup thread = %@",[NSThread currentThread]);
    }];
}


#pragma mark - 终止当前线程 (不可恢复) -
-(void)method_3{
    [NSThread exit];//执行后.线程到这里就结束了,下面的不会再执行
    NSLog(@"method_3 thread1  isExecuting = %d isFinished = %d isCancelled = %d",_thread.isExecuting,_thread.isFinished,_thread.isCancelled);
    NSLog(@"method_3");
}

#pragma mark - 在指定线程中执行任务 -
-(void)method_4{
//    //子线程需要手动开启runloop才行
//    _thread = [NSThread new];
//
//    //⚠️如果线程不具备runloop,那么performSelectorOnThread/afterDelay是无法执行的
//    [self performSelector:@selector(backgroundMehtod1) onThread:_thread withObject:nil waitUntilDone:NO];
    
//    _port = [NSPort new];
    
    //开启runloop
    _thread = [[NSThread alloc] initWithBlock:^{
        //这个方法开启的runloop 对应的关闭为  CFRunLoopStop([NSRunLoop currentRunLoop].getCFRunLoop);
        BOOL a = [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        
        //⚠️直接调用run方法,会导致创建的runloop无法停止(移除port也不行,不知道为啥),可以用来开启一条常驻线程
//        [[NSRunLoop currentRunLoop] addPort:self.port forMode:NSDefaultRunLoopMode];
//        [[NSRunLoop currentRunLoop] run];
        
        //如果runloop不关闭 那么线程不会退出执行,这里也不会打印
        NSLog(@"退出线程 - %d",a);
    }];
    [_thread start];
    //这个方法可以指定在当前线程的runloop中的某些mode下执行
    [self performSelector:@selector(backgroundMehtod2) onThread:_thread withObject:nil waitUntilDone:NO modes:@[NSDefaultRunLoopMode,NSRunLoopCommonModes]];
}
#pragma mark - 线程执行的顺序 -
-(void)method_5 {
    //线程执行的顺序为 start - main - finish/cancel/exit
    //main方法内部为线程执行的主要方法,如果某些特定的任务需要一直开线程执行,那么直接写在main方法里面即可
    LYThread *thread = [[LYThread alloc] initWithBlock:^{
        
        //如果重写了main方法,那么block就不会走了,而是执行main方法
        NSLog(@"lythread excuted");
    }];
    [thread start];
}

#pragma mark - 线程优先级
-(void)method_6{
    /*
     与用户交互的任务，这些任务通常跟UI级别的刷新相关，比如动画，这些任务需要在一瞬间完成
     NSQualityOfServiceUserInteractive = 0x21,
     
     在实现用户精确请求请求相关工作时使用UserInitiated QoS，但不要求精确到毫秒，比如动画。例如，如果用户打开email app马上查看邮件。
     NSQualityOfServiceUserInitiated = 0x19,
     
     UtilityQoS用于执行已经由用户请求自动发生的任务。例如，电子邮件应用程序可以被配置为每隔5分钟自动检查邮件。
     如果系统是非常有限的资源，而电子邮件检查被推迟几分钟这也是被允许的。
     NSQualityOfServiceUtility = 0x11,
     
     // Background QoS用于执行用户可能甚至都没有意识到正在发生的工作，比如email app可能使用它来执行索引搜索
     NSQualityOfServiceBackground = 0x09,
     
     // 优先级介于user-initiated 和 utility，当没有 QoS信息时默认使用，开发者不应该使用这个值来设置自己的任务
     NSQualityOfServiceDefault = -1
     */
    NSThread *thread = [[NSThread alloc] initWithBlock:^{
        
    }];
    [thread setQualityOfService:(NSQualityOfServiceUserInteractive)];
}

#pragma mark - 线程间的通讯 -
-(void)method_7{
    //可以通过performselector的方法指定某个thread
    //通过NSPort
}


#pragma mark - method -
-(void)backgroundMehtod1{
    NSLog(@"backgroup thread = %@",[NSThread currentThread].name);
    //打印线程的调用栈中的函数地址 以及调用栈的调用方法
    NSLog(@"%@ - %@",NSThread.callStackReturnAddresses,NSThread.callStackSymbols);
    //
    NSLog(@"33 thread1 isExecuting = %d isFinished = %d isCancelled = %d",[NSThread currentThread].isExecuting,[NSThread currentThread].isFinished,[NSThread currentThread].isCancelled);
}


-(void)backgroundMehtod2{
    for (int i = 0; i < 5; i++) {
        sleep(1);
        //外部调用cancel后 循环还是会继续执行 需要自己在循环中判断
        if ([NSThread currentThread].isCancelled) {
            break;
        }
        NSLog(@"current thread = %@ %s %d",[NSThread currentThread],__func__,i);
    }
        
    //停止runloop -> 通过添加port开启的runloop无法用这种方法关闭
//    CFRunLoopStop([NSRunLoop currentRunLoop].getCFRunLoop);
    
    //如果当前线程runloop还在运行 那么这个方法就会执行
    [self performSelector:@selector(checkCurrentThreadIsOpenRunloop) withObject:nil afterDelay:1.0];
}

-(void)checkCurrentThreadIsOpenRunloop{
    NSLog(@"**** %s ****",__func__);
}
@end
