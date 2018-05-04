//
//  AppModel.h
//  04-通过代码实现应用管理
//
//  Created by apple on 15/11/17.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppModel : NSObject

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) NSString *name;

- (instancetype)initWithDict:(NSDictionary *)dict;


+ (instancetype)appModelWithDict:(NSDictionary *)dict;

@end
