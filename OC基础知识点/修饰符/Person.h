//
//  Person.h
//  修饰符
//
//  Created by linyu on 2020/7/15.
//  Copyright © 2020 linyu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PersonProtocol <NSObject>

@end

@interface Person : NSObject

@property(nonatomic,strong)NSArray *families;

@property(nonatomic,copy)NSString *name;

@property(nonatomic,weak)id<PersonProtocol> delegate;

@property(nonatomic,retain)NSMutableArray *cards;

@property(nonatomic,assign)int age;

@property(nonatomic,unsafe_unretained)int sexual;

@end

NS_ASSUME_NONNULL_END
