//
//  GrouponsModel.h
//  02-团购基本实现
//
//  Created by apple on 15/11/10.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GrouponsModel : NSObject

@property (nonatomic, copy) NSString *buyCount;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, copy) NSString *title;


// 对象方法
- (instancetype)initWithDict:(NSDictionary *)dict;

// 类方法
+ (instancetype)grouponsModelWidthDict:(NSDictionary *)dict;

@end
