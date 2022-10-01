//
//  main.m
//  Block变量的捕获02
//
//  Created by 林域 on 2021/8/26.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        NSArray<NSNumber *> *array = [NSMutableArray array];
        static NSString* str = @"aaa";
        
        printf("0、array指向的地址 - %p array本身的地址 - %p \n",array,&array);
        
        printf("a、staticArr指向的地址 - %p staticArr本身的地址 - %p \n",str,&str);
        
        void(^block)(void) = ^{// array是auto属性，被捕获到blcok中，并拷贝了一份。
            printf("1、array指向的地址 - %p array本身的地址 - %p \n",array,&array);
//            array = [NSMutableArray new];//尝试赋值会报错
            
            str = @"bbb";
                        
            printf("b、staticArr指向的地址 - %p staticArr本身的地址 - %p \n",str,&str);
        };

        block();
        printf("2、array指向的地址 - %p array本身的地址 - %p \n",array,&array);
        printf("c、staticArr指向的地址 - %p staticArr本身的地址 - %p \n",str,&str);
    }
    return 0;
}

