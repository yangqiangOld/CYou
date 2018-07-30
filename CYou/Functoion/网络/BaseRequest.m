//
//  BaseRequest.m
//  CYou
//
//  Created by 时间财富网 on 2018/7/25.
//  Copyright © 2018年 时间财富网. All rights reserved.
//

#import "BaseRequest.h"

@implementation BaseRequest

- (instancetype)init {
    if (self = [super init]) {
        [self requestBaseSet];
    }
    return self;
}

- (void)requestBaseSet {
    //
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    session.requestSerializer = [AFHTTPRequestSerializer serializer];
    
}



@end
