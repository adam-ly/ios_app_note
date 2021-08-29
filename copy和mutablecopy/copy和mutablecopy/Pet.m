
//
//  Pet.m
//  copy和mutablecopy
//
//  Created by linyu on 2020/5/18.
//  Copyright © 2020 linyu. All rights reserved.
//

#import "Pet.h"

@implementation Pet

-(id)mutableCopyWithZone:(NSZone *)zone{
    Pet *p = [Pet new];
    p.pet_name = [_pet_name mutableCopy];
    p.ID = _ID;
    return p;
}

-(id)copyWithZone:(NSZone *)zone{
    return [self mutableCopyWithZone:zone];
}

-(NSString *)description{
    return [NSString stringWithFormat:@"pet_name = %@,ID = %d",_pet_name,_ID];
}

@end
