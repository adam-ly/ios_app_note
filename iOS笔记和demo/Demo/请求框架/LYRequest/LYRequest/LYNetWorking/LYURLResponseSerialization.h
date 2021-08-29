//
//  LYURLResponseSerialization.h
//  LYRequest
//
//  Created by 林域 on 2019/1/3.
//  Copyright © 2019 林域. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/*
 根据服务器响应中的细节，“AFURLResponseSerialization”协议被一个对象采用，该对象将数据解码为更有用的对象表示。 响应序列化器还可以对传入的响应和数据执行验证。
 例如，JSON响应序列化程序可以检查可接受的状态代码（`2XX`范围）和内容类型（`application / json`），将有效的JSON响应解码为对象。
 */
@protocol LYURLResponseSerialization <NSObject,NSSecureCoding,NSCopying>

/**
 响应对象从与指定响应关联的数据中解码。
 
 @param response要处理的响应。
 @param data要解码的响应数据。
 @param error尝试解码响应数据时发生的错误。
 
 @return从指定的响应数据解码的对象。
 */
- (nullable id)responseObjectForResponse:(nullable NSURLResponse *)response
                                    data:(nullable NSData *)data
                                   error:(NSError * _Nullable __autoreleasing *)error NS_SWIFT_NOTHROW;
@end

@interface LYURLResponseSerialization : NSObject



@end

NS_ASSUME_NONNULL_END
