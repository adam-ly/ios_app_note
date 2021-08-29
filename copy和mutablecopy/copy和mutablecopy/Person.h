//
//  Person.h
//  copy和mutablecopy
//
//  Created by linyu on 2020/5/18.
//  Copyright © 2020 linyu. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Pet;
NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject<NSMutableCopying,NSCopying>

@property(nonatomic,strong)Pet *pet;

@property(nonatomic,copy)NSString *name;

@property(nonatomic,assign)int age;

@property(nonatomic,strong)NSNumber *height;

@end

NS_ASSUME_NONNULL_END
