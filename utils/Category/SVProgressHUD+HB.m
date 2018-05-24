//
//  SVProgressHUD+HB.m
//  小程序iOS版
//
//  Created by weijiqian on 2018/4/20.
//  Copyright © 2018年 weijiqian. All rights reserved.
//

#import "SVProgressHUD+HB.h"

@implementation SVProgressHUD (HB)


+(void)showMessage:(NSString *)msg{
    [self showWithStatus:msg];
    [self setFont:[UIFont systemFontOfSize:18]];
    [self setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [self setDefaultStyle:SVProgressHUDStyleDark];
}

+(void)showMessage:(NSString *)msg withFont:(UIFont *)font{
    
    [self showWithStatus:msg];
    [self setFont:font];
    [self setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [self setDefaultStyle:SVProgressHUDStyleDark];
}

+(void)showMessageWithNoCover:(NSString *)msg{
    [self showWithStatus:msg];
    [self setFont:[UIFont systemFontOfSize:18]];
    [self setDefaultMaskType:SVProgressHUDMaskTypeNone];
    [self setDefaultStyle:SVProgressHUDStyleDark];
}

@end
