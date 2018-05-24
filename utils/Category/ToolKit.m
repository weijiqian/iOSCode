//
//  ToolKit.m
//  Love
//
//  Created by 秦田新 on 15/11/30.
//  Copyright © 2015年 zoesap. All rights reserved.
//

#import "ToolKit.h"

@implementation NSMutableDictionary(safe_setObject)

- (void)safe_setObject:(id)anObject forKey:(id<NSCopying>)aKey {
    if ( aKey ) {
        if ( anObject==nil ) {
            [self removeObjectForKey:aKey];
        }
        else {
            [self setObject:anObject forKey:aKey];
        }
    }
}

@end

@implementation NSMutableArray (OpenetExt)

-(void)safe_addObject:(id)anObject {
    if ( anObject ) {
        [self addObject:anObject];
    }
}

@end


@implementation ToolKit

id dicGetObject(NSDictionary *dic, id aKey, Class aClass) {
    id result = [dic objectForKey:aKey];
    if ( result && [result isKindOfClass:aClass] ) {
        return result;
    }
    return nil;
}

NSDictionary * dicGetDic(NSDictionary *dic, id aKey) {
    return (NSDictionary *)dicGetObject(dic, aKey, [NSDictionary class]);
}

NSMutableDictionary * dicGetMutableDic(NSDictionary *dic, id aKey) {
    return (NSMutableDictionary *)dicGetObject(dic, aKey, [NSMutableDictionary class]);
}


NSString * dicGetString(NSDictionary *dic, id aKey) {
    id result = [dic objectForKey:aKey];
    if ( result && [result isKindOfClass:[NSNumber class]] ) {
        return [NSString stringWithFormat:@"%@",result];
    }else if (result && [result isKindOfClass:[NSString class]] ){
        return (NSString*)result;
    }
    return nil;
}

NSString * dicGetStringSafe(NSDictionary *dic, id aKey) {
    if (dicGetString(dic, aKey) && dicGetString(dic, aKey).length>0) {
        return dicGetString(dic, aKey);
    }
    
    return @"";
}

int dicGetInt(NSDictionary *dic, id aKey, int nDefault) {
    id result = [dic objectForKey:aKey];
    if ( result && [result isKindOfClass:[NSNumber class]] ) {
        return [(NSNumber *)result intValue];
    }
    else if ( result && [result isKindOfClass:[NSString class]] ) {
        return [(NSString *)result intValue];
    }
    
    return nDefault;
    
}

float dicGetFloat(NSDictionary *dic, id aKey, float fDefault) {
    id result = [dic objectForKey:aKey];
    if ( result && [result isKindOfClass:[NSNumber class]] ) {
        return [(NSNumber *)result floatValue];
    }
    else if ( result && [result isKindOfClass:[NSString class]] ) {
        return [(NSString *)result floatValue];
    }
    
    return fDefault;
    
}

NSArray * dicGetArray(NSDictionary *dic, id aKey) {
    return (NSArray *)dicGetObject(dic, aKey, [NSArray class]);
}

NSArray * dicGetArraySafe(NSDictionary *dic, id aKey) {
    if ([dic objectForKey:aKey] && ![[dic objectForKey:aKey] isKindOfClass:[NSArray class]]) {
        return [NSArray arrayWithObject:[dic objectForKey:aKey]];
    }
    return dicGetArray(dic, aKey);
}

NSMutableArray * dicGetMutableArray(NSDictionary *dic, id aKey) {
    return (NSMutableArray *)dicGetObject(dic, aKey, [NSMutableArray class]);
}

NSDictionary * arrGetDic(NSArray *arr, NSUInteger index) {
    NSDictionary *result = nil;
    if ( index<arr.count ) {
        result = [arr objectAtIndex:index];
        if ( result && [result isKindOfClass:[NSDictionary class]] ) {
            return result;
        }
    }
    return nil;
}




@end
