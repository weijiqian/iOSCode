//
//  GroupsModel.h
//  02-QQ好友列表
//
//  Created by apple on 15/11/14.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroupsModel : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *online;

@property (nonatomic, strong) NSArray *friends;

// 记录该组是否展开，默认是NO
@property (nonatomic, assign,getter=isExplain) BOOL explain;


- (instancetype)initWithDict:(NSDictionary *)dict;


+ (instancetype)groupsModelWith:(NSDictionary *)dict;

@end
