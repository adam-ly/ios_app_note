//
//  Person.m
//  copy和mutablecopy
//
//  Created by linyu on 2020/5/18.
//  Copyright © 2020 linyu. All rights reserved.
//

#import "Person.h"
#import "Pet.h"

@implementation Person {
    int _money;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        _money = 100;
    }
    return self;
}

-(id)mutableCopyWithZone:(NSZone *)zone{
    Person *p = [Person new];
    p.name = [_name mutableCopy];
    p.age = _age;
    p->_money = _money;
    p.pet = [_pet mutableCopy];
    p.height = @([_height intValue]);
    return p;
}

//这里直接给个新对象
-(id)copyWithZone:(NSZone *)zone{
//    return [self mutableCopyWithZone:zone];
    Person *p = [[[self class]allocWithZone:zone] init];
    p.name = _name;
    p.age = _age;
    p.pet = _pet;
    p->_money = _money;
    p.height = _height;
    return p;
}

//-(NSString *)description{
//    return [NSString stringWithFormat:@"self = %p name = %@ age = %d _money = %d height = %@ ||--> _pet = %@",&self,_name,_age,_money,_height,_pet];
//}

@end
