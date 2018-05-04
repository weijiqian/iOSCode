//
//  WeiboModel.m
//  09-简单微博
//
//  Created by apple on 15/11/10.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "WeiboModel.h"

@implementation WeiboModel


- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)weiboModelWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}


@end
