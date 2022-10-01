//
//  main.m
//  block中的weak和strong
//
//  Created by 林域 on 2021/8/29.
//

#import <Foundation/Foundation.h>
#import "TestObj.h"
#import <objc/runtime.h>
#import <objc/objc-runtime.h>


void releaseObj(NSObject *obj);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        #pragma mark - 情况1 -
        TestObj *o = [TestObj new];
        NSLog(@"oo address = %p",o);
                
        //使用__weak的obj指针，会随着block拷贝到堆区，此时block中有一个新的指针指向obj所指向的对象，并且保留__weak属性，避免循环引用
        __weak TestObj *obj = o;
        void(^block)(void) = ^{
            //在block里面创建一个strong类型的obj2，并指向block中拷贝的(weak)obj对象，此时block并不持有obj对象，
            //因此会保证（weak）obj的生命周期能持续到block结束，结束后obj2自然也就释放掉了。
            //所以即使外面的（weak）obj在block执行的过程中被release了，由于obj2强引用了，所以obj的生命周期，最少也是到block执行结束
            __strong TestObj *obj2 = obj;
            [obj2 printSelf];
            printf("结束\n");
        };        
        block();
    }
    return 0;
}

void releaseObj(NSObject *o)
{
    o = nil;
    NSLog(@"o address = %p",o);
}
