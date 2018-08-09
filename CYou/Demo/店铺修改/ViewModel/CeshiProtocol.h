//
//  CeshiProtocol.h
//  CYou
//
//  Created by 时间财富网 on 2018/8/3.
//  Copyright © 2018年 时间财富网. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^CeshiProtocolBlock)(int ceNumber);

@protocol CeshiProtocol <NSObject>

- (void)ceshiProtocol:(CeshiProtocolBlock)handler;


@end
