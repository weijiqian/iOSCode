//
//  ContentFrameModel.h
//  09-简单微博
//
//  Created by apple on 15/11/10.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class WeiboModel;

// 单一原则

@interface ContentFrameModel : NSObject

// 头像的frame
@property (nonatomic, assign,readonly) CGRect userImageFrame;

// 名称的frame
@property (nonatomic, assign,readonly) CGRect userNmaeFrame;

// vip的frame
@property (nonatomic, assign,readonly) CGRect vipImageFrame;

// 文本的frame
@property (nonatomic, assign,readonly) CGRect contentFrame;

// 配图的frame
@property (nonatomic, assign,readonly) CGRect pictureImageFrame;


// cell 的高度
@property (nonatomic, assign,readonly) CGFloat cellHeight;

// 只有拿到数据， 才能对每一个控件的frame进行计算
@property (nonatomic, strong) WeiboModel *weiboModel;


@end
