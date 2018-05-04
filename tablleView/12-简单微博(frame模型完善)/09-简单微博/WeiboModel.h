//
//  WeiboModel.h
//  09-简单微博
//
//  Created by apple on 15/11/10.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeiboModel : NSObject

// 表示文本内容
@property (nonatomic, copy) NSString *text;

// 表示头像
@property (nonatomic, copy) NSString *icon;

// 表示配图
@property (nonatomic, copy) NSString *picture;

// 用户名称
@property (nonatomic, copy) NSString *name;

// 表示是否是vip ， 1 表示 是
@property (nonatomic, assign) NSInteger vip;


- (instancetype)initWithDict:(NSDictionary *)dict;


+ (instancetype)weiboModelWithDict:(NSDictionary *)dict;

@end
