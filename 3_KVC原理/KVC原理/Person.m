//
//  Person.m
//  KVC原理
//
//  Created by linyu on 2021/5/16.
//

#import "Person.h"

@interface Person()

@property(nonatomic,copy)NSString *nickName;

@end

@implementation Person
{
    NSString *_name; //1
    NSString *_isName;//2
    NSString *name;//3
    NSString *isName;//4
}
-(instancetype)init{
    self = [super init];
    if (self) {
        _name = @"_name_";
        _isName = @"_isName_";
        name = @"name_";
        isName = @"isName_";
    }
    return self;
}

-(void)printAllMember{
    NSLog(@"_name = %@",_name);
    NSLog(@"_isName = %@",_isName);
    NSLog(@"name = %@",name);
    NSLog(@"isName = %@",isName);
}

#pragma mark - accessInstanceVariablesDirectly -
//如果返回NO,将不会自动搜索类似 _key,iskey 之类的成员
+ (BOOL)accessInstanceVariablesDirectly{
    return YES;
}

#pragma mark - setter -
//通过注释掉代码查看执行的顺序

//// 1
//-(void)setName:(NSString *)name{
//    NSLog(@"%s - %@",__func__,name);
//}
//
//// 2
//-(void)_setName:(NSString *)name{
//    NSLog(@"%s",__func__);
//}
//
//// 3
//-(void)setIsName:(NSString *)name{
//    NSLog(@"%s",__func__);
//}

#pragma mark - getter -
//通过注释掉代码查看执行的顺序

//1
-(NSString *)getName{
    return @"getName";
}
//2
-(NSString *)name{
    return @"name";
}
//3
-(NSString *)isName{
    return @"isName";
}
//4
-(NSString *)_name{
    return @"_name";
}

#pragma mark - undefined -
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"setforUndefinedKey value = %@,key = %@",value,key);
}

-(id)valueForUndefinedKey:(NSString *)key{
    NSLog(@"getforUndefinedKey key = %@",key);
    return NULL;
}



@end
