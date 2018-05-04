//
//  AppModel.m
//  05-使用xib实现应用管理
//
//  Created by apple on 15/11/17.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "AppModel.h"

@implementation AppModel

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    
    }
    return self;
}

+ (instancetype)appModelWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
