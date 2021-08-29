//
//  main.m
//  Block变量的捕获
//
//  Created by 林域 on 2021/8/20.
//

#import <Foundation/Foundation.h>

int gloable = 5;
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        /**
         1、ARC环境下，block如果访问了auto属性，那么它会被自动copy到堆上，包括auto属性也会被拷贝到堆上。
         2、全局变量存在于全局区，所以不需要捕获，任何时候都可以直接访问。
         3、静态变量存在于静态存储区，内存随着系统结束后释放，所以只需要知道它的地址即可。
         4、自动变量auto，存在于栈区，由于栈是由编译器管理释放，如果引用到该auto变量的block在其他地方执行，此时auto已经被
            系统销毁了，那么block里面访问到的就是野指针。
         */
                
        //⚠️ ARC
        int innerVariable = 1;
        static int static_variable = 3;
        
        //没有访问auto变量，所以这是一个global的block
        void(^GlobalBlock)(void) = ^{
            printf("block0 = %d",gloable);
            printf("block0 = %d",static_variable);
        };
               
        //访问了auto变量，所以arc环境下会自动帮block copy到堆区。
        void(^block)(void) = ^{
            printf("gloable inner = %d\n",gloable);
            printf("innerVariable inner = %d\n",innerVariable);
            printf("static_variable = inner = %d\n",static_variable);
            gloable = 50;
//            innerVariable = 10; // 无法修改auto的值，因为它是值传递。而global是直接访问。static是传入地址。
            static_variable = 20;
        };
        
        block();
        
        printf("gloable outter = %d\n",gloable);
        printf("innerVariable outter = %d\n",innerVariable);
        printf("static_variable = outter = %d\n",static_variable);
        NSLog(@"%@",[block class]);
        NSLog(@"%@",[GlobalBlock class]);
        
    }
    return 0;
}
