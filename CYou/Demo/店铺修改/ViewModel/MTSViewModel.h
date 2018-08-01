//
//  MTSViewModel.h
//  CYou
//
//  Created by 时间财富网 on 2018/7/31.
//  Copyright © 2018年 时间财富网. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTSViewModel : NSObject

@property (strong, nonatomic)ReturnValueBlock returnValueBlock;
@property (strong, nonatomic)ErrorCodeBlock errorCodeBlock;
@property (strong, nonatomic)FailureBlock failureBlock;

//获取网络的链接状态
- (void)netWorkStateWithNetConnectBlock:(NetWorkBlock)netConnectBlock withURLStr:(NSString *)strURL;

// 传入交互的Block块
-(void) setBlockWithReturnBlock: (ReturnValueBlock) returnBlock
                 WithErrorBlock: (ErrorCodeBlock) errorBlock
               WithFailureBlock: (FailureBlock) failureBlock;

- (void)requestData;

@end
