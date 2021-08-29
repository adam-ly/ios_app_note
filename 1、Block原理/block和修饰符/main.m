//
//  main.m
//  block和修饰符
//
//  Created by 林域 on 2021/8/26.
//

#import <Foundation/Foundation.h>
#import "TestObj.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        #pragma mark - __weak造成的引用计数问题 -
        __strong TestObj *a = [TestObj new];
        __weak TestObj *b = a;
        
        // a的引用计数为1，因为只被强引用一次。
        printf("a retain count =  %lu\n",CFGetRetainCount((__bridge  CFTypeRef)a));
        
        NSUInteger count = CFGetRetainCount((__bridge  CFTypeRef)b);
        // b的打印结果是2，但其实如果在这里打断点，并且输出b的引用计数，可以看到跟预想的一样都是1.
        // 这是因为打印函数调用__weak对象时，会把__weak对象的引用计数+1，出函数后会自动-1.
        printf("b retain count =  %lu\n",CFGetRetainCount((__bridge  CFTypeRef)b));
        
        
        __strong TestObj *obj1 = [TestObj new];
        __strong TestObj *o = [TestObj new];
        __weak TestObj *obj2 = o;
                
        void(^block)(void) = ^{//obj1和obj2被拷贝了一份，注意是拷贝指针。指向原来的对象
            NSLog(@"obj1 = %@",obj1);
            NSLog(@"obj2 = %@",obj2);
        };
        obj2 = nil;
        block();
    }
    return 0;
}
