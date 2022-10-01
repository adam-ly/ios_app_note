//
//  main.m
//  KVC原理
//
//  Created by linyu on 2021/5/16.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /**
         * KVC原理: 这里的key为name
         *
         * 1、通过valueForKey获取值:
         *    1、按顺序查找相应get的方法 getName -> name -> isName -> _name.
         *    2、判断accessInstanceVariablesDirectly返回值,如果为YES,则从成员变量中查找,否则不会继续
         *    3、查找成员变量, 按照固定的顺序查找, _name -> _isName -> name -> isName;
         *
         * 2、通过setValueForKey赋值:
         *    1、按顺序查找相应set的方法 setName -> _setName -> setIsName
         *    2、判断accessInstanceVariablesDirectly返回值,如果为YES,则从成员变量中查找,否则不会继续
         *    3、查找成员变量, 按照固定的顺序查找, _name -> _isName -> name -> isName;
         *    注意: 在没有实现set方法的情况下,如果key与成员变量完全相同,比如name,那么也按顺序赋值给_name先,而不是name.
         *
         * KVA:注意点
         * 1、如果value是基本数据类型,需要转化成NSNumber才可以.
         * 2、如果是结构体,那么需要包装成NSValue.
         */
        
        Person *p = [Person new];
        [p setValue:@"haha" forKey:@"name"];
//        NSLog(@"%@",[p valueForKey:@"name"]);        
        [p printAllMember];
        
    }
    return 0;
}
