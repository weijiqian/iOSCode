//
//  FriendsModel.h
//  02-QQ好友列表
//
//  Created by apple on 15/11/14.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FriendsModel : NSObject

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger vip;


- (instancetype)initWithDict:(NSDictionary *)dict;


+ (instancetype)friendsModelWith:(NSDictionary *)dict;

@end
