//
//  ViewController.m
//  02-自定义布局
//
//  Created by xiaomage on 15/8/6.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "ViewController.h"
#import "XMGLineLayout.h"
#import "XMGPhotoCell.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@end

@implementation ViewController

static NSString * const XMGPhotoId = @"photo";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建布局
    XMGLineLayout *layout = [[XMGLineLayout alloc] init];
    layout.itemSize = CGSizeMake(200, 200);
    
    // 创建CollectionView
    CGFloat collectionW = self.view.frame.size.width;
    CGFloat collectionH = 400;
    CGRect frame = CGRectMake(0, 150, collectionW, collectionH);
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [self.view addSubview:collectionView];
    
    // 注册
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([XMGPhotoCell class]) bundle:nil] forCellWithReuseIdentifier:XMGPhotoId];
    
    // 继承UICollectionViewLayout
    // 继承UICollectionViewFlowLayout
}

#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    XMGPhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:XMGPhotoId forIndexPath:indexPath];
    
    cell.imageName = [NSString stringWithFormat:@"%zd", indexPath.item + 1];
    
//    cell.backgroundColor = [UIColor orangeColor];
//    
//    NSInteger tag = 10;
//    UILabel *label = (UILabel *)[cell.contentView viewWithTag:tag];
//    if (label == nil) {
//        label = [[UILabel alloc] init];
//        label.tag = tag;
//        [cell.contentView addSubview:label];
//    }
//    
//    label.text = [NSString stringWithFormat:@"%zd", indexPath.item];
//    [label sizeToFit];
    
    return cell;
}

#pragma mark - <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"------%zd", indexPath.item);
}
@end
