//
//  main.m
//  __Block的原理_02
//
//  Created by 林域 on 2021/8/24.
//

#import <Foundation/Foundation.h>


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        int b = 10;
        __block int *a = &b;
        NSLog(@"1 %d - %p - %p",*a,a,&a);
                
        void(^block)(void) = ^{
            int c = 20;
            a = &c;
            NSLog(@"3 %d - %p - %p",*a,a,&a);
        };
        NSLog(@"2 %d - %p - %p",*a,a,&a);
        block();
        NSLog(@"4 %d - %p - %p",*a,a,&a);
    }
    
    // 打印结果
    // 1 10 ｜ a指向的地址 = 0x16fdff40c｜a的地址 = 0x16fdff40
    // 2 10 ｜ a指向的地址 = 0x16fdff40c｜a的地址 = 0x10061e718
    // 3 20 ｜ a指向的地址 = 0x16fdff34c｜a的地址 = 0x10061e718
    // 4 20 ｜ a指向的地址 = 0x16fdff34c｜a的地址 = 0x10061e718
    
    /**
     __block修饰a，此时将a包装成一个对象。一个auto对象《A》。并将b的地址传给 A.forwarding.a.
     A在编译期被copy一份到堆区，生成《B》。可以看到1和234中，A.forwarding.a 和 B.forwarding.a 的地址是不一样的
     
     在block执行前，1和2分别是： A.forwarding.a. = &b，B.forwarding.a. = &b 所以他们保存的是同一个地址
     而block执行后，3和4是 ：B.forwarding.a. = &c
     */

    return 0;
}
