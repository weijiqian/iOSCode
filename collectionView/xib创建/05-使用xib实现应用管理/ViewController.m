//
//  ViewController.m
//  05-使用xib实现应用管理
//
//  Created by apple on 15/11/17.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "ViewController.h"
#import "AppModel.h"
#import "AppCell.h"

@interface ViewController ()<UICollectionViewDataSource>

@property (nonatomic, strong) NSArray *dataArray;

@end

static NSString *identifier = @"collectionCell";

@implementation ViewController

#pragma mark -
#pragma mark -  懒加载
- (NSArray *)dataArray {
    if (nil == _dataArray) {
        
        // 路
        NSString *path = [[NSBundle mainBundle] pathForResource:@"app.plist" ofType:nil];
        
        // 读
        NSArray *tempArayy = [NSArray arrayWithContentsOfFile:path];
        
        // 变
        NSMutableArray *mutable = [NSMutableArray array];
        
        // 转
        for (NSDictionary *dict in tempArayy) {
            AppModel *model = [AppModel appModelWithDict:dict];
            
            [mutable addObject:model];
        }
        
        // 赋
        _dataArray = mutable;
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    // 1. 实例化一个 collectinViewFlowLayout
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
//    flowLayout.itemSize = CGSizeMake(100, 100);
    
    
    // 2. 实例化一个 collectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    
    
    // 3. 设置数据源
    collectionView.dataSource = self;
    
    // 4. 注册cell
//    [collectionView registerClass:[AppCell class] forCellWithReuseIdentifier:identifier];
    
    UINib *nib = [UINib nibWithNibName:@"AppCell" bundle:nil];
    
    // 把appCell对象读取出来
    AppCell *cell = [nib instantiateWithOwner:nil options:nil].lastObject;
    
    // 根据xib中cell, 设置itemsize的大小
    flowLayout.itemSize = cell.frame.size;
#warning 如果使用xib 这里必须注册为nib , 不然cell 不会正常显示
    [collectionView registerNib:nib forCellWithReuseIdentifier:identifier];
    
    // 设置距离四周的间距
    flowLayout.sectionInset = UIEdgeInsetsMake(40, 10, 0, 10);
    
    // 5. 设置背景色
    collectionView.backgroundColor = [UIColor whiteColor];
    
    // 6. 添加到控制器的view上
    [self.view addSubview:collectionView];
}

// 组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

// 行

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

// 每行

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AppCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor orangeColor];
    
    // 取出appModel
    AppModel *model = self.dataArray[indexPath.row];
    
    cell.appModel = model;
    
    return cell;
}


@end
