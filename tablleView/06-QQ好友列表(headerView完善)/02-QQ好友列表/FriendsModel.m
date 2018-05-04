//
//  FriendsModel.m
//  02-QQ好友列表
//
//  Created by apple on 15/11/14.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "FriendsModel.h"

@implementation FriendsModel


- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}


+ (instancetype)friendsModelWith:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}


@end
