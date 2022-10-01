//
//  main.m
//  Autorelasepool源码分析
//
//  Created by linyu on 2020/7/2.
//  Copyright © 2020 linyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

//将源码中打印releasePool的方法暴露出来
extern void _objc_autoreleasePoolPrint(void);

#pragma mark - 打印autoreleasepage中的对象 -

/*
 网上对于iOS工程的main()函数中的@autoreleasepool有一种解释：
 在iOS工程的main()函数中有一个@autoreleasepool，这个@autoreleasepool负责了应用程序所有autorelease对象的释放。
 
 其实这个解释是错误的。
 
 如果你的程序使用了AppKit或UIKit框架，那么主线程的RunLoop就会在每次事件循环迭代中创建并处理@autoreleasepool。
 也就是说，应用程序所有autorelease对象的都是由RunLoop创建的@autoreleasepool来管理。而main
 ()函数中的@autoreleasepool只是负责管理它的作用域中的autorelease对象。
 */


int main(int argc, const char * argv[]) {

#if 0
    //单个autoReleasepool
    _objc_autoreleasePoolPrint();     // print1
    printf("====================11==================\n\n");
    @autoreleasepool {
        _objc_autoreleasePoolPrint(); // print2
        printf("==================22====================\n\n");
        Person *p1 = [[[Person alloc] init] autorelease];
        Person *p2 = [[[Person alloc] init] autorelease];
        _objc_autoreleasePoolPrint(); // print3
        printf("===================33===================\n\n");
    }
    _objc_autoreleasePoolPrint();     // print4
    ///由打印可以看出 每次往自动释放池添加东西的时候 需要先插入一个nil哨兵
#else if 0
//      @autoreleasepool { //r1 = push()
//          //多重嵌套的autoReleasepool
//            printf("====================11==================\n\n");
//            _objc_autoreleasePoolPrint();         // print2
//            Person *p1 = [[[Person alloc] init] autorelease];
//            Person *p2 = [[[Person alloc] init] autorelease];
//            printf("====================22==================\n\n");
//            _objc_autoreleasePoolPrint();         // print3
//            @autoreleasepool { //r2 = push()
//                Person *p3 = [[[Person alloc] init] autorelease];
//                printf("====================33==================\n\n");
//                _objc_autoreleasePoolPrint();     // print4
//                @autoreleasepool { //r3 = push()
//                    Person *p4 = [[[Person alloc] init] autorelease];
//                    printf("====================44==================\n\n");
//                    _objc_autoreleasePoolPrint(); // print5
//                } //pop(r3)
//                printf("====================55==================\n\n");
//                _objc_autoreleasePoolPrint();     // print6
//            } //pop(r2)
//          printf("====================66==================\n\n");
//            _objc_autoreleasePoolPrint();         // print7
//        } //pop(r1)
//         printf("====================77==================\n\n");
//        _objc_autoreleasePoolPrint();             // print8
#endif
    
//    @autoreleasepool超出一页的情况
    //看打印第三行 objc[87703]: 1303 releases pending. 可以看出这里待释放的有1303个对象.自己创建的有1300个,以及3个page
    @autoreleasepool { //r1 = push()
        
        //page的size为4096  8*1300 需要用3个page来装.
        
            for (int i = 0; i < 600; i++) {
                Person *p = [[[Person alloc] init] autorelease];
            }
            @autoreleasepool { //r2 = push()
                for (int i = 0; i < 500; i++) {
                    Person *p = [[[Person alloc] init] autorelease];
                }
                @autoreleasepool { //r3 = push()
                    for (int i = 0; i < 200; i++) {
                        Person *p = [[[Person alloc] init] autorelease];
                    }
                    _objc_autoreleasePoolPrint();
                } //pop(r3)
            } //pop(r2)
        } //pop(r1)
    return 0;

}
/*
objc[37596]: ##############
objc[37596]: AUTORELEASE POOLS for thread 0x1000d3dc0
objc[37596]: 0 releases pending.
objc[37596]: ##############
======================================

objc[37596]: ##############
objc[37596]: AUTORELEASE POOLS for thread 0x1000d3dc0
objc[37596]: 0 releases pending.
objc[37596]: [0x1]  ................  PAGE (placeholder)
objc[37596]: [0x1]  ################  POOL (placeholder)
objc[37596]: ##############
======================================

objc[37596]: ##############
objc[37596]: AUTORELEASE POOLS for thread 0x1000d3dc0
objc[37596]: 3 releases pending.
objc[37596]: [0x102814000]  ................  PAGE  (hot) (cold)
objc[37596]: [0x102814038]  ################  POOL 0x102814038
objc[37596]: [0x102814040]       0x100784ed0  Person
objc[37596]: [0x102814048]       0x100783f90  Person
objc[37596]: ##############
======================================

2020-07-09 15:50:22.589487+0800 Autorelasepool源码分析[37596:1855287] dealloc
2020-07-09 15:50:22.590080+0800 Autorelasepool源码分析[37596:1855287] dealloc
objc[37596]: ##############
objc[37596]: AUTORELEASE POOLS for thread 0x1000d3dc0
objc[37596]: 0 releases pending.
objc[37596]: [0x102814000]  ................  PAGE  (hot) (cold)
objc[37596]: ##############
Program ended with exit code: 0
*/
#pragma mark - 打印嵌套autoreleasePool时autoreleasepage中的对象 -
