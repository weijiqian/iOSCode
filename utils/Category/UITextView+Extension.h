//
//  UITextView+Extension.h
//  weibo
//
//  Created by weijiqian on 2018/5/23.
//  Copyright © 2018年 weijiqian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (Extension)
- (void)insertAttributeText:(NSAttributedString *)text;
- (void)insertAttributedText:(NSAttributedString *)text settingBlock:(void (^)(NSMutableAttributedString *attributedText))settingBlock;
@end
