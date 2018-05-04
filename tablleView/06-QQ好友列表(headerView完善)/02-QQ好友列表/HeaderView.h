//
//  HeaderView.h
//  02-QQ好友列表
//
//  Created by apple on 15/11/14.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GroupsModel,HeaderView;

@protocol HeaderViewDelegate <NSObject>

- (void)headerView:(HeaderView *)headerView didClickButton:(UIButton *)button;

@end

@interface HeaderView : UITableViewHeaderFooterView

@property (nonatomic, strong) GroupsModel *groupModel;

@property (nonatomic, weak) id<HeaderViewDelegate> delegate;

// headerView 不能对自己内部的子控件进行直接操作， 而是要交给使用者(代理)
@property (nonatomic, assign) BOOL rotageImageView;

@end
