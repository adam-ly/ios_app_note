//
//  main.m
//  修饰符
//
//  Created by linyu on 2020/7/15.
//  Copyright © 2020 linyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        /*ios中属性修饰符有以下几种:
         1、copy
         2、strong
         3、weak
         4、retain
         5、assign
         6、unsafe_unretain
         7、readwrite/readonly
         8、nonatomic/atomic (安全策略)
         */
        
        Person *p = [Person new];
        
        //1、copy修饰的属性 会在赋值的时候进行一次拷贝,具体是深拷贝还是浅拷贝,要根据拷贝的对象来定. (mutablecopy/copy)
        NSString *name = [NSString stringWithFormat:@"A%@",@"dam"];
        p.name = name;
        NSLog(@"浅拷贝 name = %p p.name = %p \n",name,p.name);
        
        NSMutableString *name1 = [[NSMutableString alloc] initWithString:@"Lambert"];
        p.name = name1;
        NSLog(@"深拷贝 name = %p p.name = %p \n",name1,p.name);
        
        //2、strong和retain 前者在ARC后者在MRC模式下 都表示对修饰对象进行《强引用》,对象的引用计数+1
        
        //3、weak : 弱引用 引用计数不+1,对象被释放后 会自动指向nil
        //⚠️weak修饰的单例对象,如果引用计数为0,也会被自动释放掉,这是它的内部机制决定的
        
        //4、unsafe_unretain : 弱引用 引用计数不+1,对象被释放后 会指向被销毁的内存 变成野指针,继续使用会引起闪退
        
        //5、assign : 修饰基本数据类型.
        
        //6、readwrite/readonly : 读写权限.
        
        //7、nonatomic/atomic (安全策略) : 原子性/非原子性.
    }
    return 0;
}


