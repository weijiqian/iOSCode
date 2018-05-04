//
//  GrouponsModel.m
//  02-团购基本实现
//
//  Created by apple on 15/11/10.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "GrouponsModel.h"

@implementation GrouponsModel

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)grouponsModelWidthDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
