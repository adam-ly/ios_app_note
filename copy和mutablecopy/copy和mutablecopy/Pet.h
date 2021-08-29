//
//  Pet.h
//  copy和mutablecopy
//
//  Created by linyu on 2020/5/18.
//  Copyright © 2020 linyu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Pet : NSObject<NSMutableCopying,NSCopying>

@property(nonatomic,copy)NSString *pet_name;

@property(nonatomic,assign)int ID;

@end

NS_ASSUME_NONNULL_END
