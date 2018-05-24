//
//  HBUserFileManager.m
//  HuBeiBusiness
//
//  Created by 秦田新 on 2017/4/19.
//  Copyright © 2017年 秦田新. All rights reserved.
//

#import "HBUserFileManager.h"


@implementation HBUserFileManager
HHSingletonM(Manager)


-(BOOL)isLogIn{
    return self.userId.length>0;
}


-(NSString *)username{
        return [self getUserDefaultValueForKey:@"username"];
}

-(NSString *)account{
    return [self getUserDefaultValueForKey:@"acount"];
}
-(NSString *)userId{
    return [self getUserDefaultValueForKey:@"userid"];
    
}
-(NSString *)userImagePath{
    return [self getUserDefaultValueForKey:@"userImagePath"];
}

-(void)setAccount:(NSString *)account{
    [self setUserDefaultValue:account forKey:@"acount"];
}
-(void)setUserId:(NSString *)userId{
    [self setUserDefaultValue:userId forKey:@"userid"];
}
-(void)setUserImagePaht:(NSString *)userImagePath{
    [self setUserDefaultValue:userImagePath forKey:@"userImagePath"];
}


-(void)setUsername:(NSString *)username{
     [self setUserDefaultValue:username forKey:@"username"];
}


-(void)setUserDefaultValue:(NSString *)value forKey:(NSString *)key{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if (value && key.length>0) {
        [userDefaults setObject:value forKey:[NSString stringWithFormat:@"%@",key]];
        [userDefaults synchronize];
    }
}

-(NSString *)getUserDefaultValueForKey:(NSString *)key{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:[NSString stringWithFormat:@"%@",key]];
}


@end
