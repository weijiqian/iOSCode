//
//  GroupsModel.m
//  02-QQ好友列表
//
//  Created by apple on 15/11/14.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "GroupsModel.h"
#import "FriendsModel.h"

@implementation GroupsModel

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        // kvc 赋值过后， 当前grousModel中所有的属性都已经有值
        // self.friends 数组中 装的都是字典， 因此 需要转为  FriendsModel 模型
        [self setValuesForKeysWithDictionary:dict];
        
        // 创建一个可变数组
        NSMutableArray *mutable = [NSMutableArray array];
        
        // 遍历 self.friends 把里面的字典转为模型
        for (NSDictionary *dict in self.friends) {
            FriendsModel *friends = [FriendsModel friendsModelWith:dict];
            
            [mutable addObject:friends];
        }
        
        // mutable 现在装的是 FriendsModel 这种类型的 ， 需要赋值给  self.friends
        self.friends = mutable;
        
        // self.friends　里装的都是FriendsModel 这种类型的
        
    }
    return self;
}


+ (instancetype)groupsModelWith:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
