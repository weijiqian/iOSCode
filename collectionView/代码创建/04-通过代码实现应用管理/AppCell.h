//
//  AppCell.h
//  04-通过代码实现应用管理
//
//  Created by apple on 15/11/17.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class  AppModel;

@interface AppCell : UICollectionViewCell

@property (nonatomic, strong) AppModel *appModel;

@end
