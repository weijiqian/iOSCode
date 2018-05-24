//
//  SVProgressHUD+HB.h
//  小程序iOS版
//
//  Created by weijiqian on 2018/4/20.
//  Copyright © 2018年 weijiqian. All rights reserved.
//

#import "SVProgressHUD.h"

@interface SVProgressHUD (HB)

+(void)showMessage:(NSString *)msg;

+(void)showMessage:(NSString *)msg withFont:(UIFont *)font;

+(void)showMessageWithNoCover:(NSString *)msg;

@end
