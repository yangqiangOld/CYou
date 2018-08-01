//
//  MTSViewModel.m
//  CYou
//
//  Created by 时间财富网 on 2018/7/31.
//  Copyright © 2018年 时间财富网. All rights reserved.
//

#import "MTSViewModel.h"
#import "ModeifyFirstModel.h"

@implementation MTSViewModel

- (void)netWorkStateWithNetConnectBlock:(NetWorkBlock)netConnectBlock withURLStr:(NSString *)strURL {
    
    
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager startMonitoring];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
//        NSLog(@"网络状态：%ld", status);
        netConnectBlock(status);
    }];
    
}

#pragma 接收穿过来的block
-(void) setBlockWithReturnBlock: (ReturnValueBlock) returnBlock
                 WithErrorBlock: (ErrorCodeBlock) errorBlock
               WithFailureBlock: (FailureBlock) failureBlock
{
    _returnValueBlock = returnBlock;
    _errorCodeBlock = errorBlock;
    _failureBlock = failureBlock;
}

- (void)requestData {
    //再加一层
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < 3; i++) {
        ModeifyFirstModel *model = [[ModeifyFirstModel alloc] init];
        model.content = [NSString stringWithFormat:@"第%d行", i];
        [arr addObject:model];
    }
    
    self.returnValueBlock(arr);
}

@end
