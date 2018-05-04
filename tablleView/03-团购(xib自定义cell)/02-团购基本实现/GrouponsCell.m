//
//  GrouponsCell.m
//  02-团购基本实现
//
//  Created by apple on 15/11/10.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "GrouponsCell.h"
#import "GrouponsModel.h"

@interface GrouponsCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@property (weak, nonatomic) IBOutlet UILabel *buyCountLabel;

@end

@implementation GrouponsCell

- (void)awakeFromNib {
    // Initialization code
    
    NSLog(@"awakeFromNib");
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        NSLog(@"initWithFrame");
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        NSLog(@"initWithStyle");
    }
    return self;
}

- (void)setGrouponsModel:(GrouponsModel *)grouponsModel {
    // 一定要先给属性赋值
    _grouponsModel = grouponsModel;
    
    // 对控件进行赋值
    _iconImageView.image = [UIImage imageNamed:_grouponsModel.icon];
    _nameLabel.text = grouponsModel.title;
    _priceLabel.text = [NSString stringWithFormat:@"$%@", grouponsModel.price];
    
    _buyCountLabel.text = [NSString stringWithFormat:@"已卖出:%@",grouponsModel.buyCount];
    
}
@end
