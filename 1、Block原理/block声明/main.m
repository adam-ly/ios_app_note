//
//  main.m
//  block声明
//
//  Created by 林域 on 2021/8/26.
//

#import <Foundation/Foundation.h>

void blockFunc(void);
int main(int argc, const char * argv[]) {
    
    //1、 定义 返回值(^名称)(参数)
    // 使用 (^)返回值(参数)
    void(^block)(void) = ^void(void){ //
        printf("block \n");
    };
    
    //2、block的定义中如果返回值和参数都不需要，可以省略
    void(^block1)(void) = ^ {
        printf("block11 \n");
    };
    
    //3、如果返回值和参数类型一致，可以省略返回值
    int(^block2)(int) = ^(int a){
        return a + 2;
    };
    
    //4、没有参数可省略参数
    int(^block3)(void) = ^int {
        return 2;
    };
    
    //5、没有返回值可省略
    void(^block4)(int) = ^(int a){
        
    };
        
    
    //⚠️函数指针类型与block非常相似，除了把*换成^.
    void(*block5)(void) = &blockFunc;
    block3();

    return 0;
}

void blockFunc(void){
    printf("\n block2 \n");
}
