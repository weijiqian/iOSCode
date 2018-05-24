//
//  ToolKit.h
//  Love
//
//  Created by 秦田新 on 15/11/30.
//  Copyright © 2015年 zoesap. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ToolKit : NSObject


id dicGetObject(NSDictionary *dic, id aKey, Class aClass);
NSDictionary * dicGetDic(NSDictionary *dic, id aKey);
NSMutableDictionary * dicGetMutableDic(NSDictionary *dic, id aKey);
NSString * dicGetString(NSDictionary *dic, id aKey);
NSString * dicGetStringSafe(NSDictionary *dic, id aKey);
int dicGetInt(NSDictionary *dic, id aKey, int nDefault);
float dicGetFloat(NSDictionary *dic, id aKey, float fDefault);
NSArray * dicGetArray(NSDictionary *dic, id aKey);
NSArray * dicGetArraySafe(NSDictionary *dic, id aKey);
NSString *dicTransformToJson(NSDictionary *dic);
NSString *dicDeepTransformToJson(NSDictionary *dic);
NSString *objectDeepTransformToJson(NSObject *obj);
NSMutableArray * dicGetMutableArray(NSDictionary *dic, id aKey);
id arrGetObject(NSArray *arr, NSUInteger index, Class aClass);
NSDictionary * arrGetDic(NSArray *arr, NSUInteger index);
NSMutableDictionary * arrGetMutableDic(NSArray *arr, NSUInteger index);
NSArray * arrGetArray(NSArray *arr, NSUInteger index);
NSString *arrGetString(NSArray *arr, NSUInteger index);
NSArray * arrGetArray(NSArray *arr, NSUInteger index);


@end
@interface NSMutableDictionary (safe_setObject)
- (void)safe_setObject:(id)anObject forKey:(id<NSCopying>)aKey;

@end

@interface NSMutableArray(safe_addObject)
-(void)safe_addObject:(id)anObject;

@end
