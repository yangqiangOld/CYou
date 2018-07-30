//
//  AFNetworking_YQ.m
//  CYou
//
//  Created by 时间财富网 on 2018/7/24.
//  Copyright © 2018年 时间财富网. All rights reserved.
//

#import "AFNetworking_YQ.h"

static CGFloat timeoutInterval = 10.f;

@implementation AFNetworking_YQ

+ (void)getWithUrl:(NSString *)url params:(NSDictionary *)params success:(SuccessBlock)success failure:(FailureBLOCK)failure {
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    //设置请求格式
    session.requestSerializer = [AFHTTPRequestSerializer serializer];
    //设置返回格式
    session.responseSerializer = [AFHTTPResponseSerializer serializer];
    //设置超时时间
    session.requestSerializer.timeoutInterval = timeoutInterval;
    //设置响应格式
    session.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    
    [session GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //利用iOS自带原生JSON解析data数据 保存为Dictionary
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        success(dict);
        NSLog(@"测试数据%@", dict);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

+ (void)postWithUrl:(NSString *)url params:(NSDictionary *)params success:(SuccessBlock)success failure:(FailureBLOCK)failure {
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    //设置请求格式
    session.requestSerializer = [AFHTTPRequestSerializer serializer];
    //设置返回格式
    session.responseSerializer = [AFHTTPResponseSerializer serializer];
    //设置超时时间
    session.requestSerializer.timeoutInterval = timeoutInterval;
    //设置响应格式
    session.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    
    NSStringEncoding CFencoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    
    [session POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSData *data = responseObject;
        NSString *string = [[NSString alloc] initWithData:data encoding:CFencoding];
        
        NSData *dataCode = [string dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:dataCode options:NSJSONReadingMutableLeaves error:nil];
        
        success(dic);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

@end
