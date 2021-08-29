//
//  main.m
//  copy和mutablecopy
//
//  Created by linyu on 2020/5/18.
//  Copyright © 2020 linyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Pet.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /**
         1 类直接继承自NSObject，无需调用[super copyWithZone:zone]
         2 父类实现了copy协议，子类也实现了copy协议，子类需要调用[super copyWithZone:zone]
         3 父类没有实现copy协议，子类实现了copy协议，子类无需调用[super copyWithZone:zone]
         4、copyWithZone方法中要调用[[[self class] alloc] init]来分配内存
         */
        Pet *pet1 = [Pet new];
        pet1.pet_name = @"miky";
        pet1.ID = 29;
        
        Person *p1 = [Person new];
        p1.age = 1;
        p1.height = @(30);
        p1.name = @"ly";
        p1.pet = pet1;
                
        Person *p2 = [p1 copy];
        Person *p3 = [p1 mutableCopy];
        NSLog(@"\n p1 = %@ \n,p2 = %@ \n,p3 = %@ \n",p1,p2,p3);
        
    }
    return 0;
}
