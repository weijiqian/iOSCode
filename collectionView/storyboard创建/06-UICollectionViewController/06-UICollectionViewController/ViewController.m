//
//  ViewController.m
//  06-UICollectionViewController
//
//  Created by apple on 15/11/17.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

static NSString *identifier = @"collectionCell";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /**
     self.view  UICollectionViewControllerWrapperView
     
     self.collectionView   UICollectionView
     */
    
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:identifier];
    
    // 设置背景颜色
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    
    /**
     取出 collectionView的 flowlayout
     
     self.collectionViewLayout  只读的
     
     self.collectionView.collectionViewLayout  做一步强转 
     */
    
    UICollectionViewFlowLayout *folowLayout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    
    
    folowLayout.itemSize = CGSizeMake(100, 100);
    
    // Pin 钉住, 类似tableView的悬浮效果
    folowLayout.sectionFootersPinToVisibleBounds = YES;
    folowLayout.sectionHeadersPinToVisibleBounds = YES;
    
    // 在垂直滚动的时候, 设置宽度无效
    // 水平滚动的时候, 设置高度无效
    folowLayout.headerReferenceSize = CGSizeMake(10, 50);
    folowLayout.footerReferenceSize = CGSizeMake(20, 70);
    
    folowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;

}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}

/**
 UICollectionElementKindSectionHeader   头部
 UICollectionElementKindSectionFooter   尾部
 */

#pragma mark -
#pragma mark -  设置组头/尾 的时候要通过代理方法进行返回
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
#warning 如果在storboard中设置了组头或组尾, 必须设置 重用标识符
    static NSString *headerIdentifier = @"header";
    
    headerIdentifier = (kind == UICollectionElementKindSectionHeader) ? @"header" : @"footer";
    
    
    UICollectionReusableView *resuableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerIdentifier forIndexPath:indexPath];
    
    return resuableView;
    
}








@end
