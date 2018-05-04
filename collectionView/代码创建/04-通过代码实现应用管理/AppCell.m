//
//  AppCell.m
//  04-通过代码实现应用管理
//
//  Created by apple on 15/11/17.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "AppCell.h"
#import "AppModel.h"

@interface AppCell()

@property (nonatomic, weak) UIImageView *iconImageView;


@property (nonatomic, weak) UILabel *nameLabel;

@end

@implementation AppCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 设置cell的背景色
        self.backgroundColor = [UIColor redColor];
        
//        CGSize cellSize = self.contentView.frame.size;
//        
//        // 添加imageView
//        CGFloat iconWidth  = cellSize.width * 0.6;
//        CGFloat iconX = (cellSize.width - iconWidth)/2;
        
        UIImageView *iconImageView = [[UIImageView alloc] init];
        
        // 对属性赋值
        self.iconImageView = iconImageView;
        
        [self.contentView addSubview:iconImageView];
        
        
        // 添加label
        UILabel *nameLabel = [[UILabel alloc] init];
        
        self.nameLabel = nameLabel;
        
        // 设置label的属性
        nameLabel.font = [UIFont systemFontOfSize:13];
        nameLabel.textAlignment = NSTextAlignmentCenter;
        nameLabel.textColor = [UIColor blackColor];
        
        nameLabel.text = @"爸爸去哪";
        
        [self.contentView addSubview:nameLabel];
        
    }
    return self;
}

// 当view的size 发生变化的时候调用
- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGSize cellSize = self.contentView.frame.size;
    
    // 添加imageView
    CGFloat iconWidth  = cellSize.width * 0.6;
    CGFloat iconX = (cellSize.width - iconWidth)/2;
    
    _iconImageView.frame = CGRectMake(iconX, 0, iconWidth, iconWidth);
    
    
    _nameLabel.frame = CGRectMake(0, CGRectGetMaxY(_iconImageView.frame), cellSize.width, 20);
    
}

// 重写set方法
- (void)setAppModel:(AppModel *)appModel {
    _appModel = appModel;
    
    // 对子控件赋值
    
    _iconImageView.image = [UIImage imageNamed:appModel.icon];
    
    
    _nameLabel.text = appModel.name;
}

@end
