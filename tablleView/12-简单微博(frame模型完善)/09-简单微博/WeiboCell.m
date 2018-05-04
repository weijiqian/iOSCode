//
//  WeiboCell.m
//  09-简单微博
//
//  Created by apple on 15/11/10.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "WeiboCell.h"
#import "WeiboModel.h"
#import "ContentFrameModel.h"

@interface WeiboCell()

@property (nonatomic, weak) UIImageView *userImageView;

@property (nonatomic, weak) UIImageView *vipImageView;

@property (nonatomic, weak) UIImageView *pictureImageView;

@property  (nonatomic, weak) UILabel *nameLabel;

@property (nonatomic, weak) UILabel *contentLabel;



@end

@implementation WeiboCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        // 初始化cell的界面
        [self setupUI];
        
    }

    return self;
}

#pragma mark -
#pragma mark -  初始化界面
- (void)setupUI {
    
     // 1. 用户头像的imageView
    UIImageView *userImageView = [[UIImageView alloc] init];
    
    // 添加到 cell 的 contentView
    self.userImageView = userImageView;
    
    [self.contentView addSubview:userImageView];
    
    // 2. 用户名称的 UILabel
    UILabel *nameLabel = [[UILabel alloc] init];
    
    self.nameLabel = nameLabel;
    
    [self.contentView addSubview:nameLabel];
    
    // 3. vip 的 UIImageView
    UIImageView *vipImageView = [[UIImageView alloc] init];
    
    
    self.vipImageView = vipImageView;
    
    self.vipImageView.image = [UIImage imageNamed:@"vip"];
    
    
    [self.contentView addSubview:vipImageView];
    
    // 4. 文本内容的 UILabel
    UILabel *contentLabel = [[UILabel alloc] init];
    
    self.contentLabel = contentLabel;
    
    // 自动换行
    contentLabel.numberOfLines = 0;
    
    // 设置字体为15
    contentLabel.font = [UIFont systemFontOfSize:15];
    
    // 
    
    [self.contentView addSubview:contentLabel];
    
    // 5. 配图的 UIImageView
    UIImageView *pictureImageView = [[UIImageView alloc] init];
    
    self.pictureImageView = pictureImageView;
    
    [self.contentView addSubview:pictureImageView];
    
}


#pragma mark -
#pragma mark -  设置数据
- (void)setContentFrameModel:(ContentFrameModel *)contentFrameModel{
    _contentFrameModel = contentFrameModel;
    
    // 赋值
    [self setupData];
    
    
    // 设置frame
    [self setupFrame];
     
}


#pragma mark -
#pragma mark -  为控件赋值
- (void)setupData {
    // 取出 weiboModel
    WeiboModel *weiboModel = _contentFrameModel.weiboModel;
    
    // 为cell中的控件进行赋值
    
    // 给用户头像赋值
    self.userImageView.image = [UIImage imageNamed:weiboModel.icon];
    
    // 给名字赋值
    self.nameLabel.text = weiboModel.name;
    
    // vip ，只需要设置一次， 把这条语句放到初始化中
//    self.vipImageView.image = [UIImage imageNamed:@"vip"];
    
    // 文本内容
    self.contentLabel.text = weiboModel.text;
    
    // 配图
    if (weiboModel.picture) {
        self.pictureImageView.image = [UIImage imageNamed:weiboModel.picture];
    }
    
    // 如果是vip 就让nameLabel显示红色
#warning 在cell中， 如果牵扯到属性(color) 一定要做else 处理
    if (weiboModel.vip == 1) {
        _nameLabel.textColor = [UIColor redColor];
    } else {
        _nameLabel.textColor = [UIColor blackColor];
    }
}

#pragma mark -
#pragma mark -  设置控件的frame
- (void)setupFrame {
    
    _userImageView.frame = _contentFrameModel.userImageFrame;
    
    _nameLabel.frame = _contentFrameModel.userNmaeFrame;
    
    _vipImageView.frame = _contentFrameModel.vipImageFrame;
    
    
    _contentLabel.frame = _contentFrameModel.contentFrame;
    
    
    _pictureImageView.frame = _contentFrameModel.pictureImageFrame;
}


@end
