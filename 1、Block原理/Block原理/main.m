//
//  main.m
//  Block原理
//
//  Created by 林域 on 2021/8/19.
//

#import <Foundation/Foundation.h>

void blockFunc(void);
int main(int argc, const char * argv[]) {

//    void(^block)(void) = ^void(void){
    // 定义 返回值(^名称)(参数)
    // 使用 (^)返回值(参数)
    void(^block)(void) = ^{
        printf("a");
    };
    
    NSLog(@"%@",[block class]);
        
    void(*block2)(void) = &blockFunc;
    block2();
    return 0;
}

void blockFunc(void){
    printf("\n block2 \n");
}

