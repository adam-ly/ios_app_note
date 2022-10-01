//
//  main.m
//  修饰符
//
//  Created by 林域 on 2021/8/26.
//

#import <Foundation/Foundation.h>
#import "TestObj.h"

void __StrongFunc(void);
void __WeakFunc(void);
void __unsafe_unretain(void);
void __autoreleasingFunc(void);

int main(int argc, const char * argv[]) {
            
    
    __StrongFunc();
//
//    __WeakFunc();
    
//    __unsafe_unretain();

//    __autoreleasingFunc();
    return 0;
}


#pragma mark - __Strong -
void __StrongFunc(void){
    
    //1、可以看出 不管是否有__strong，结果都一样，所以默认其实就是__strong
    __strong id arr = nil;
    {
        id obj = [NSMutableArray array];
        
        arr = obj;
        
        //引用计数一致。
        printf("obj retain count =  %lu\n",CFGetRetainCount((__bridge  CFTypeRef)obj));
        printf("arr retain count =  %lu\n",CFGetRetainCount((__bridge  CFTypeRef)arr));
    }
    
    printf("======================================\n");
    
    __weak id a = nil;
    {
        /**
         __strong 修饰符在ARC中是默认设置的。 而在MRC中需要手动retain才会持有。
         以下在mrc中相当于
         {
             id obj = [TestObj new];
             [obj release]; //在作用域结束时调用release。
         }
         */
        id __strong obj = [TestObj new]; //这里引用计数就为1了因为obj持有该对象，所以obj的引用计数是1.

        //
        a = obj; // 在mrc中相当于 a =【obj retain】

        //obj的引用计数为1，因为通过new初始化出来的TestObj引用计数就是1
        printf("obj retain count =  %lu\n",CFGetRetainCount((__bridge  CFTypeRef)obj));

        //a 的引用计数为2，因为打印__weak修饰的对象的时候，打印函数为了保证对象存在，需要将对象进行强引用一下        
        printf("a retain count =  %lu\n",CFGetRetainCount((__bridge  CFTypeRef)a));

        //⚠️但是这里相同。。。？
        printf("a = %p, obj = %p \n",a,obj);
    }

//    __strong修饰的对象超出作用域自动release。达到 MRC 中手动设置release的效果
    NSLog(@"a = %@",a);
        
    printf("======================================\n");
}

#pragma mark - __weak -
void __WeakFunc(void){
    //__weak修饰的对象obj，将TestObj对象赋予obj时，obj不会持有这个对象，所以会立马释放掉。
    __weak id obj = [TestObj new];
    {
        obj = [TestObj new];//并且__weak修饰的对象 ，在其持有的实例被释放时，会自动指向nil
    }
    NSLog(@"obj = %@",obj);
}


#pragma mark - unsafe_unretain -
void __unsafe_unretain(void) {
    //__unsafe_unretained修饰的对象，在对象被释放时不会自动将指针置为nil，因此再次访问可能会引起程序崩溃
    __unsafe_unretained id obj;
    {
        obj = [TestObj new];
    }
    //野指针
//    NSLog(@"obj = %@",obj);
}

#pragma mark -  -
void __autoreleasingFunc(void) {
    
    //Arc使用autorelease
    @autoreleasepool {
        id obj01 = [TestObj new];
    }
        
    
    //mrc使用autorelease，其实就是通过使用__autoreleasing修饰符来实现
    __autoreleasing id obj02 = [TestObj new];
    
}
