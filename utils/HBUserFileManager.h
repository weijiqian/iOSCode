//
//  HBUserFileManager.h
//  HuBeiBusiness
//
//  Created by 秦田新 on 2017/4/19.
//  Copyright © 2017年 秦田新. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"

@interface HBUserFileManager : NSObject
HHSingletonH(Manager)

-(BOOL)isLogIn;

-(NSString *)username;
-(NSString *)account;
-(NSString *)userId;
-(NSString *)userImagePath;




-(void)setUsername:(NSString *)username;
-(void)setAccount:(NSString *)account;
-(void)setUserId:(NSString *)userId;
-(void)setUserImagePaht:(NSString *)userImagePath;


@end
