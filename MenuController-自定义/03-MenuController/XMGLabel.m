//
//  XMGLabel.m
//  03-MenuController
//
//  Created by xiaomage on 15/8/3.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "XMGLabel.h"

@implementation XMGLabel

- (void)awakeFromNib
{
    [self setup];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.userInteractionEnabled = YES;
}

/**
 * 让label有资格成为第一响应者
 */
- (BOOL)canBecomeFirstResponder
{
    return YES;
}

/**
 * label能执行哪些操作(比如copy, paste等等)
 * @return  YES:支持这种操作
 */
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    return NO;
}
@end
