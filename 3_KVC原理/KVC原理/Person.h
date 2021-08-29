//
//  Person.h
//  KVC原理
//
//  Created by linyu on 2021/5/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property(nonatomic,assign)int age;

-(void)printAllMember;
@end

NS_ASSUME_NONNULL_END
