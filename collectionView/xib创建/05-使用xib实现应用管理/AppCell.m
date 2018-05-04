//
//  AppCell.m
//  05-使用xib实现应用管理
//
//  Created by apple on 15/11/17.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "AppCell.h"
#import "AppModel.h"

@interface AppCell()

// 如果注册的时候使用的是appCell 而不是 AppCell.xib 下面两个控件都是空的

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation AppCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setAppModel:(AppModel *)appModel {
    _appModel = appModel;
    
    
    // 对子控件赋值
    _iconImageView.image = [UIImage imageNamed:appModel.icon];
    
    _nameLabel.text = appModel.name;
}

@end
