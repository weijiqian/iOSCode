//
//  QQCell.h
//  02-QQ好友列表
//
//  Created by apple on 15/11/14.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FriendsModel;

@interface QQCell : UITableViewCell

@property (nonatomic, strong) FriendsModel *friendsModel;

@end
