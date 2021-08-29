//
//  main.m
//  copy&mutableCopy
//
//  Created by linyu on 2020/7/15.
//  Copyright © 2020 linyu. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
#pragma mark -
        //copy 不拷贝对象本身 而是拷贝对象的指针
        //mutablecopy 拷贝对象到另外一块内存中
                
#pragma mark - 测试 copy & mutableCopy 对可变对象和不可变对象的影响 -
        printf("============= copy + 不可变对象 =============\n");
        
        NSString *str = @"3123";
        NSString *str1 = [str copy];
        printf("str = %p - str1 = %p\n",str,str1); //地址相等,可见str和str1两个指针内容相等
        
        NSArray *arr = [NSArray arrayWithObject:@"aa"];
        NSArray *arr1 = [arr copy];
        printf("arr = %p - arr1 = %p\n",arr,arr1); //地址相等,可见arr和arr1两个指针内容相等
        
        
        printf("\n============= copy + 可变对象 =============\n");
        NSString *mutstr = [[NSMutableString alloc] initWithString:@"ddd"];
        NSString *mutstr1 = [mutstr copy];
        printf("mutstr = %p - mutstr1 = %p\n",mutstr,mutstr1); //地址不等
         //可以执行
//        [(NSMutableString *)mutstr appendString:@"123"];
        //⚠️发生闪退, 可见可变字符串copy后会生成一个新的不可变字符串
//        [(NSMutableString *)mutstr1 appendString:@"123"];
                
        NSArray *mutarr = [NSMutableArray arrayWithObject:@"ddd"];
        NSArray *mutarr1 = [mutarr copy];
        printf("arr = %p - arr1 = %p\n",mutarr,mutarr1); //地址不等
        //可以执行
//        [(NSMutableArray *)mutarr addObject:@"sss"];
        //⚠️发生闪退, 可见可变数组copy后会生成一个新的不可变数组
//        [(NSMutableArray *)mutarr1 addObject:@"sss"];
        
        printf("\n============= mutablecopy + 不可变对象/可变对象 =============\n");
        NSString *mutableStr = str.mutableCopy;
        NSString *mutableStr1 = mutableStr.mutableCopy;
        printf("mutableStr = %p - mutableStr1 = %p\n",mutableStr,mutableStr1); //地址不等
        [(NSMutableString *)mutableStr appendString:@"lll"]; //√
        [(NSMutableString *)mutableStr1 appendString:@"lll"];//√
        
        NSArray *mutableArr = arr.mutableCopy;
        NSArray *mutableArr1 = mutableArr.mutableCopy;
        printf("mutableArr = %p - mutableArr = %p\n",mutableArr,mutableArr1); //地址不等
        [(NSMutableArray *)mutableArr addObject:@"456"];//√
        [(NSMutableArray *)mutableArr1 addObject:@"456"];//√
                                
#pragma mark - 总结 -
        /**
         1、copy一个《不可变》对象,只会拷贝它的《指针》.
         2、copy一个《可变》对象,会拷贝对象的内存,并生成一个《不可变》对象
         3、mutablecopy一个《不可变》对象,会拷贝对象的内存,并生成一个《可变》对象
         4、mutablecopy一个《可变》对象,会拷贝对象的内存,并生成一个《可变》对象
         */
    }
    return 0;
}
