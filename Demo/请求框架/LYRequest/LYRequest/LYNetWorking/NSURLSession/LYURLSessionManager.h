//
//  LYURLSessionManager.h
//  LYRequest
//
//  Created by 林域 on 2019/1/2.
//  Copyright © 2019 林域. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LYURLResponseSerialization.h"
#import "LYNetworkReachabilityManager.h"

NS_ASSUME_NONNULL_BEGIN

/*
 LYURLSessionManager基于指定的NSURLSessionConfiguration对象创建和管理`NSURLSession对象，该对象实现了`<NSURLSessionTaskDelegate>`，`<NSURLSessionDataDelegate>`，`<NSURLSessionDownloadDelegate>`和`<NSURLSessionDelegate>几个协议
 
 `LYURLSessionManager` implements the following delegate methods:
 
 ### `NSURLSessionDelegate`
 
 - `URLSession:didBecomeInvalidWithError:`
 - `URLSession:didReceiveChallenge:completionHandler:`
 - `URLSessionDidFinishEventsForBackgroundURLSession:`
 
 ### `NSURLSessionTaskDelegate`
 
 - `URLSession:willPerformHTTPRedirection:newRequest:completionHandler:`
 - `URLSession:task:didReceiveChallenge:completionHandler:`
 - `URLSession:task:didSendBodyData:totalBytesSent:totalBytesExpectedToSend:`
 - `URLSession:task:needNewBodyStream:`
 - `URLSession:task:didCompleteWithError:`
 
 ### `NSURLSessionDataDelegate`
 
 - `URLSession:dataTask:didReceiveResponse:completionHandler:`
 - `URLSession:dataTask:didBecomeDownloadTask:`
 - `URLSession:dataTask:didReceiveData:`
 - `URLSession:dataTask:willCacheResponse:completionHandler:`
 
 ### `NSURLSessionDownloadDelegate`
 
 - `URLSession:downloadTask:didFinishDownloadingToURL:`
 - `URLSession:downloadTask:didWriteData:totalBytesWritten:totalBytesWritten:totalBytesExpectedToWrite:`
 - `URLSession:downloadTask:didResumeAtOffset:expectedTotalBytes:`
 
 If any of these methods are overridden in a subclass, they _must_ call the `super` implementation first.

  可通过`reachabilityManager`属性获得网络可达性状态和更改监视。 应用程序可以选择监视网络可访问性条件，以防止或暂停任何出站请求。 有关详细信息，请参阅`LYNetworkReachabilityManager`。
 
 ## NSCoding 警告
  - 编码管理器不包含任何块属性。 使用`-initWithCoder：`或`NSKeyedUnarchiver`时，请务必设置委托回调块。
 
 ## NSCopying 警告
 - `-copy`和`-copyWithZone：`返回一个新的管理器，其中新的`NSURLSession`是从原始配置创建的。
 - 操作副本不包含任何委托回调块，因为它们通常强烈捕获对“self”的引用，否则在复制时会有指向_original_会话管理器的非直观副作用。
 
 @warning后台会话的经理必须在使用期间拥有。 这可以通过创建应用程序范围或共享单例实例来完成。
 */

@interface LYURLSessionManager : NSObject

#pragma mark - properties -

//本身是异步的
@property (nonatomic, strong)NSURLSession *session;

//运行委托回调的操作队列
@property (nonatomic, strong, readonly)NSOperationQueue *operationQueue;

/**
 在使用`dataTaskWithRequest创建的数据任务中从服务器发送的响应：success：failure：`并使用`GET` /`POST` / et al运行。 响应序列化器自动验证和序列化方便方法。默认情况下，此属性设置为`AFJSONResponseSerializer`的实例。
 
 @warning`responseSerializer`一定不能是'nil`。
 */
@property (nonatomic, strong)id<LYURLResponseSerialization> responseSerializer;

#pragma mark - method -

@property (nonatomic, strong)NSArray<NSURLSessionTask *> *tasks;

@property (nonatomic, strong)NSArray<NSURLSessionDataTask *> *dataTasks;

@property (nonatomic, strong)NSArray<NSURLSessionUploadTask *> *uploadTasks;

@property (nonatomic, strong)NSArray<NSURLSessionDownloadTask *> *downloadTasks;

// 用来维护completionBlock的队列，如果为空，则使用主队列
@property (nonatomic, strong, nullable) dispatch_queue_t completionQueue;

// 用来维护completionBlock的组，如果为空，使用默认的私有组
@property (nonatomic, strong, nullable) dispatch_group_t completionGroup;

/**
 当初始调用返回“nil”时，是否尝试重试为后台会话创建上载任务。 “NO”默认情况下。
 @bug从iOS 7.0开始，有一个错误，即为后台任务创建的上传任务有时是“零”。 作为解决方法，如果此属性为“是”，AFNetworking将遵循Apple的建议再次尝试创建任务。
 */
@property (nonatomic, assign) BOOL attemptsToRecreateUploadTasksForBackgroundSessions;


#pragma mark - init -
/**
 为使用指定配置创建的会话创建并返回管理器。 这是指定的初始化程序。
 
 @param configuration 用于创建托管会话的配置。
 
 @return新创建的会话的经理。
 */
-(instancetype)initWithConfiguration:(nullable NSURLSessionConfiguration *)configuration NS_DESIGNATED_INITIALIZER;

/**
 使托管会话无效，可选择取消挂起的任务。
 
 @param cancelPendingTasks 是否取消挂起的任务。
 */
- (void)invalidateSessionCancelingTasks:(BOOL)cancelPendingTasks;

/**
 使用指定的请求创建`NSURLSessionDataTask`。
 
 @param request 请求的HTTP请求。
 @param uploadProgressBlock 更新上载进度时要执行的块对象。请注意，此块在会话队列上调用，而不是在主队列中调用。
 @param downloadProgressBlock 更新下载进度时要执行的块对象。请注意，此块在会话队列上调用，而不是在主队列中调用。
 @param completionHandler 任务完成时要执行的块对象。 此块没有返回值，并且有三个参数：服务器响应，该序列化程序创建的响应对象以及发生的错误（如果有）。
 */
- (NSURLSessionDataTask *)dataTaskWithRequest:(NSURLRequest *)request
                               uploadProgress:(nullable void (^)(NSProgress *uploadProgress))uploadProgressBlock
                             downloadProgress:(nullable void (^)(NSProgress *downloadProgress))downloadProgressBlock
                            completionHandler:(nullable void (^)(NSURLResponse *response, id _Nullable responseObject,  NSError * _Nullable error))completionHandler;


@end

NS_ASSUME_NONNULL_END
