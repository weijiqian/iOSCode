//
//  ContentFrameModel.m
//  09-简单微博
//
//  Created by apple on 15/11/10.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "ContentFrameModel.h"
#import "WeiboModel.h"

@implementation ContentFrameModel

- (void)setWeiboModel:(WeiboModel *)weiboModel {
    _weiboModel = weiboModel;
    
    // 计算每一个控件的frame
    
    // 计算头像的frame
    CGFloat margin = 10;
    CGFloat userImageWidth = 50;
    
    _userImageFrame = CGRectMake(margin, margin, userImageWidth, userImageWidth);

    // 计算用户名称的frame
    CGSize nameLabelMaxSize = CGSizeMake(MAXFLOAT, MAXFLOAT);
    
#warning 返回的是真实文本的宽高
    CGSize nameLabelRealSize = [weiboModel.name boundingRectWithSize:nameLabelMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil].size;
    
    
    CGFloat nameLabelX = CGRectGetMaxX(_userImageFrame) + margin;
    //    CGFloat nameLabelHeight = 20;
    //    CGFloat nameLabelWidth = 150;
    CGFloat nameLabelY = (userImageWidth - nameLabelRealSize.height)/ 2 + margin;
    
    _userNmaeFrame = CGRectMake(nameLabelX, nameLabelY, nameLabelRealSize.width, nameLabelRealSize.height);
    
    // 计算vip imageView的 frame
    CGFloat vipWidth = 20;
    CGFloat vipX = CGRectGetMaxX(_userNmaeFrame) + margin;
    CGFloat vipY = nameLabelY;
    
    // 并不是所有的人都是vip
    if (weiboModel.vip == 1) {
        _vipImageFrame = CGRectMake(vipX, vipY, vipWidth, vipWidth);
    } else {
        _vipImageFrame = CGRectZero;
    }
    
    
    // 计算文本的frame
    CGFloat contentLabelWidth = [UIScreen mainScreen].bounds.size.width - 2 * margin;
    
    // 给 显示的文本一个区域
    CGSize contentMaxSize = CGSizeMake(contentLabelWidth, MAXFLOAT);
    // NSFontAttributeName 字体的大小
    NSDictionary *attributesDict = @{NSFontAttributeName:[UIFont systemFontOfSize:15]};
#warning 计算文本实际宽高的时候， 计算的字体大小要和label中设置的字体大小保持一致
    // 根据限定的条件， 来计算text 真实的宽高
    CGSize contentRealSize =  [weiboModel.text boundingRectWithSize:contentMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributesDict context:nil].size;
    
    CGFloat contentLabelX = margin;
    CGFloat contentLabelY = CGRectGetMaxY(_userImageFrame) + margin;
    
    //    CGFloat contentLabelHeight = 300;
    
    _contentFrame = CGRectMake(contentLabelX, contentLabelY, contentRealSize.width, contentRealSize.height);
    
    // 配图的frame
    CGFloat pictureWidth = 2 * userImageWidth;
    CGFloat pictureX = margin;
    CGFloat pictureY = CGRectGetMaxY(_contentFrame) + margin;
    
    
    if (weiboModel.picture) {
        _pictureImageFrame = CGRectMake(pictureX, pictureY, pictureWidth, pictureWidth);
        
        // cell的高度
        _cellHeight = CGRectGetMaxY(_pictureImageFrame) + margin;
        
    } else {
        _pictureImageFrame = CGRectZero;
        
        // 没有配图， 就要按照文本的最大Y值
        _cellHeight = CGRectGetMaxY(_contentFrame) + margin;
    }
    
    
}

@end
