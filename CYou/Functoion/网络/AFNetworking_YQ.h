//
//  AFNetworking_YQ.h
//  CYou
//
//  Created by 时间财富网 on 2018/7/24.
//  Copyright © 2018年 时间财富网. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SuccessBlock)(id responseObject);
typedef void(^FailureBLOCK)(NSString *error);

@interface AFNetworking_YQ : NSObject

+ (void)getWithUrl:(NSString *)url params:(NSDictionary *)params success:(SuccessBlock)success failure:(FailureBLOCK)failure;

+ (void)postWithUrl:(NSString *)url params:(NSDictionary *)params success:(SuccessBlock)success failure:(FailureBLOCK)failure;

@end
