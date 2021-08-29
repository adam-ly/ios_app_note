# NSThread

## 1、NSThread的创建 

1. [[NSThread alloc] initWithBlock:nil];
2. [[NSThread alloc] initWithTarget:self selector:@selector(backgroundMehtod2) object:nil]
3. [NSThread detachNewThreadWithBlock:^{}];
4. \+ (void)detachNewThreadSelector:(SEL)selector toTarget:(id)target withObject:(nullable id)argument

## 2、NSThread的状态

1. cancel : 调用cancel方法为线程笔记一个取消状态,但不会退出线程,需要开发者在代码中判断cancel状态去决定是否继续执行任务.
2. isFinished: 线程是否执行完毕
3. isExecuting: 线程是否正在执行中

## 3、线程的取消

1. 调用cancel方法,在执行的代码中判断cancel的状态,如果是,那么就不继续执行任务,让线程自动退出.
2. 调用exit方法, 此举会直接终结线程.

## 4、在指定线程中执行任务

1. 在指定的自线程中执行任务 : performSelector:onthread:   
2. 在主线程中执行任务 : performSelector:onMainThread:   

## 5、线程间的通信

1. 在指定的自线程中执行任务 : performSelector:onthread:   
2. 通过开启线程的runloop,并为它添加一个NSPort, 通过port传输信息

## 6、线程的优先级

1.  NSQualityOfServiceUserInteractive = 0x21, //与用户交互的任务，这些任务通常跟UI级别的刷新相关，比如动画，这些任务需要在一瞬间完成
2. NSQualityOfServiceUserInitiated = 0x19, // 在实现用户精确请求请求相关工作时使用UserInitiated QoS，但不要求精确到毫秒，比如动画。例如，如果用户打开email app马上查看邮件。
3. NSQualityOfServiceUtility = 0x11, //UtilityQoS用于执行已经由用户请求自动发生的任务。例如，电子邮件应用程序可以被配置为每隔5分钟自动检查邮件。如果系统是非常有限的资源，而电子邮件检查被推迟几分钟这也是被允许的。
4. NSQualityOfServiceBackground = 0x09,// Background QoS用于执行用户可能甚至都没有意识到正在发生的工作，比如email app可能使用它来执行索引搜索
5. NSQualityOfServiceDefault = -1 ,// 优先级介于user-initiated 和 utility，当没有 QoS信息时默认使用，开发者不应该使用这个值来设置自己的任务

## 7、应用场景和优点

1. 可以通过开启runloop让线程常驻,可以减少开启和销毁线程的开销, 适合处理一些持续性任务.
2. 可以控制线程的开启和销毁
3. 可以设置线程的优先级
4. NSThread适合管理单个线程