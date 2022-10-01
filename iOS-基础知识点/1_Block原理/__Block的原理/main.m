//
//  main.m
//  __Block的原理
//
//  Created by 林域 on 2021/8/24.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        __block int a = 10;
        printf("1a = %p = %d \n",&a,a,a); //
        void(^block)(void) = ^{
            a = 5;
            printf("2a = %p = %d \n",&a,a); //
        };
        printf("3a = %p = %d \n",&a,a); //
        block();
        
        /* 可以看到 1a 和 3a 的地址变了，__block修饰a之后，将a包装成一个对象，
           但本质上这个对象还是auto类型，还是一样被block引用后被copy到堆上，所以3a其实等于2a */
        // 1a = 0x16fdff3b8 = 10
        // 3a = 0x10060ec98 = 10
        // 2a = 0x10060ec98 = 5
    }
    return 0;
}
