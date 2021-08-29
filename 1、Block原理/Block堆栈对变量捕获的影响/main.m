//
//  main.m
//  Block堆栈对变量捕获的影响
//
//  Created by 林域 on 2021/8/23.
//

#import <Foundation/Foundation.h>
#import "TestObj.h"

int gloable = 5;

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
                        
        /**
         MAR模式下：
         1、访问了auto变量的block不会被自动拷贝到堆上，需要手动copy，此时block会被copy到堆上，包括引用到的auto变量
         */
        
        //开启 MRC
        void (^block1)(void) = ^(){ // 没有访问任何变量，是一个全局的block
            NSLog(@"block1");
        };
        
        int age = 10;
        void (^block2)(void) = ^(){ //MRC模式下编译器不会自动为访问auto变量的block做copy操作，所以这里还是在栈区
            NSLog(@"block2 = age -- %d -- %p",age,&age); //age是值传递，传进去的是副本，但也仍在栈上。
        };
        
        //之所以要将访问auto变量的block copy到堆区，是因为auto变量存在栈上。由编译器释放。所以如果block在其他地方被延时调用了。此时auto变量可能已经被释放掉了。
        
        NSLog(@"age ad -- %p - %p",&age,&block1);//可以看出 age和block2都在栈上
        //⚠️：变量也会随着block的copy被拷贝到堆区上
        void (^block3)(void) = [ ^(){
            NSLog(@"block3 age -- %d -- %p",age,&age);//从内存地址可以看出age被copy到了堆上
        } copy];
        
        block2();
        block3();
        NSLog(@"block1:%@---->block2:%@----->block3:%@",[block1 class],[block2 class],[block3 class]);
    }
    return 0;
}


