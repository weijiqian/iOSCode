//
//  QQCell.m
//  02-QQ好友列表
//
//  Created by apple on 15/11/14.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "QQCell.h"
#import "FriendsModel.h"


@implementation QQCell


#pragma mark -
#pragma mark -  只要一个类和xib进行关联， 初始化就是这个方法
- (void)awakeFromNib {
    
    // 实例化一个view
    CGFloat lineViewHeight = 0.5;
    CGFloat lienViewY = 44 - lineViewHeight;
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, lienViewY, 375, lineViewHeight)];
    
    lineView.backgroundColor = [UIColor lightGrayColor];
    
    [self.contentView addSubview:lineView];
}

#pragma mark -
#pragma mark -  重写set方法
- (void)setFriendsModel:(FriendsModel *)friendsModel {
    // 先为 _friendsModel 赋值
    _friendsModel = friendsModel;
    
    self.imageView.image = [UIImage imageNamed:friendsModel.icon];
    
    self.textLabel.text = friendsModel.name;

    self.detailTextLabel.text = friendsModel.intro;
    
    // 如果是会员名字显示红色
    if (friendsModel.vip == 1) {
        self.textLabel.textColor = [UIColor redColor];
    } else {
        self.textLabel.textColor = [UIColor blackColor];
    }
}


@end
