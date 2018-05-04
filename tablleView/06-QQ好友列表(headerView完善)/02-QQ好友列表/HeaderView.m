//
//  HeaderView.m
//  02-QQ好友列表
//
//  Created by apple on 15/11/14.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "HeaderView.h"
#import "GroupsModel.h"

@interface HeaderView()

@property (nonatomic, weak) UIButton *headerButton;


@property (nonatomic, weak) UILabel *onlineLabel;

@end

@implementation HeaderView

#pragma mark -
#pragma mark -  外部调用的是哪个实例化方法，那么就重写哪个方法
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        // 在这个实例化方法的时候， headerView 还没有frame
        
        // 在setup中只做初始化， 不对控件的frame赋值
        [self setupUI];
    }
    
    return self;
}

#pragma mark -
#pragma mark -  当view的frame 发生改变的时候就会调用
// layout 布局 , 在这个方法里面对内部的子view进行布局(frame), 对控件设置
- (void)layoutSubviews {
#warning 一定要调用父类的方法 ， 只做frame的设置
    [super layoutSubviews];
    
    // 设置headerButton的frame
    _headerButton.frame = self.contentView.bounds;
    
    // 设置onlineLabel的frame
    
    CGFloat labelWidth = 120;
    CGFloat labelHeight = 40;
    CGFloat labelX = self.contentView.frame.size.width - labelWidth;
    
    _onlineLabel.frame = CGRectMake(labelX, 0, labelWidth, labelHeight);
}


#pragma mark -
#pragma mark -  对headerView 内部控件做初始化
- (void)setupUI {
    // 实例化一个button
    UIButton *headerButton = [[UIButton alloc] init];
    
    self.headerButton = headerButton;
//    [headerButton setBackgroundColor:[UIColor redColor]];
    
    /**
     设置背景图片
     设置图片的时候， 哪些一定要分状态
     title/titleColor ， image , backgroudImage
     
     button.titleLabel.font  // 所有状态下的文本大小
     */
    [headerButton setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg"] forState:UIControlStateNormal];
    [headerButton setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg_highlighted"] forState:UIControlStateHighlighted];
    
    // 设置图片
    [headerButton setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
    
    // 给title 设置颜色
    [headerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    // 设置button的水平对其方式
    headerButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    // 设置图片的内边距
    headerButton.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    
    // 设置文本的内边距
    headerButton.titleEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);
    
    /**
     保证button的imageView 在旋转之后保持原有的形状
     UIViewContentModeScaleToFill,  拉伸填充
     UIViewContentModeScaleAspectFit,  自适应
     UIViewContentModeScaleAspectFill,  自适应填充
     UIViewContentModeCenter,   保持原有的尺寸
     */
    
    headerButton.imageView.contentMode = UIViewContentModeCenter;
    
    // clipsToBounds ＝ YES; 超出父view的边界的部分将会被剪切掉
    headerButton.imageView.clipsToBounds = NO;
    
    // 为按钮添加点击事件
    [headerButton addTarget:self
                     action:@selector(didLClickButton:)
           forControlEvents:UIControlEventTouchUpInside];
    
    // 为button 添加右侧的label

    UILabel *onlineLabel = [[UILabel alloc] init];
    
    self.onlineLabel = onlineLabel;
    
    // 把 onlneLabel 添加到button上
    [headerButton addSubview:onlineLabel];
    
    // 让label剧中显示
    onlineLabel.textAlignment = NSTextAlignmentCenter;
    
    // 把button 添加到contentView上
    [self.contentView addSubview:headerButton];

}

#pragma mark -
#pragma mark -  点击headerButton调用
- (void)didLClickButton:(UIButton *)button {
    // 通知代理
    if ([self.delegate respondsToSelector:@selector(headerView:didClickButton:)]) {
        [self.delegate headerView:self didClickButton:button];
    }
    
}

#pragma mark -
#pragma mark - 重写 rotateImageView方法
- (void)setRotageImageView:(BOOL)rotageImageView {
    _rotageImageView = rotageImageView;
    
    if (rotageImageView) {
        // 旋转 , 朝下
        _headerButton.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
        
    } else {
        // 恢复 ， 朝右
        
        _headerButton.imageView.transform = CGAffineTransformIdentity;
    }
}



#pragma mark -
#pragma mark - 重写 groupModel 的set 方法
- (void)setGroupModel:(GroupsModel *)groupModel {
    _groupModel = groupModel;
    
    
    // 对子控件赋值
    [_headerButton setTitle:groupModel.name forState:UIControlStateNormal];
    
    
    // onlineLabel
    _onlineLabel.text = [NSString stringWithFormat:@"%@/%ld",groupModel.online,groupModel.friends.count];
    
    
}
@end
