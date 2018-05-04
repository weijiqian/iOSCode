//
//  ViewController.m
//  04-通过代码实现应用管理
//
//  Created by apple on 15/11/17.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "ViewController.h"
#import "AppCell.h"
#import "AppModel.h"

@interface ViewController ()<UICollectionViewDataSource>

@property (nonatomic, strong) NSArray *dataArray;

@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;

@end

// 定义重用标识符
static NSString *identifier = @"collectionCell";

@implementation ViewController

#pragma mark -
#pragma mark - 懒加载数据
- (NSArray *)dataArray {
    if (nil == _dataArray) {
        
        // 路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"app.plist" ofType:nil];
        
        // 读取
        NSArray *tempArray = [NSArray arrayWithContentsOfFile:path];
        
        // 可变
        
        NSMutableArray *mutable = [NSMutableArray array];
        
        // 转换
        for (NSDictionary *dict in tempArray) {
            AppModel *appModel = [AppModel appModelWithDict:dict];
            [mutable addObject:appModel];
        }
        
        // 赋值
        _dataArray = mutable;
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1. 实例化一个 collectionViewFlowLayout
    _flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    // 修改item的大小
    _flowLayout.itemSize = CGSizeMake(100, 100);
    
    // 修改cell距离view的边距
    _flowLayout.sectionInset = UIEdgeInsetsMake(40, 10, 0, 10);
    
    // 修改滚动方向
//    _flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;

    // 下面两个属性是和 滚动方向有关的
    
    // 最小列之间的间距
    _flowLayout.minimumInteritemSpacing = 50;
    
    // 设置最小行间距
//    flowLayout.minimumLineSpacing = 100;
    
   
    // 2. 实例化一个 collectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:_flowLayout];

    
    // 3. 注册一个cell
    [collectionView registerClass:[AppCell class] forCellWithReuseIdentifier:identifier];
    
    // 4. 设置数据源代理
    collectionView.dataSource = self;
    
    // 5. 添加到控制器的view上
    [self.view addSubview:collectionView];
    
    // 6. 设置collectionView的背景色
    collectionView.backgroundColor = [UIColor whiteColor];
    
}


// 组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

// 行
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}


// 每一行显示的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // 直接到缓存池中去找cell
    AppCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    // 取出appmodel
    AppModel *appModel = self.dataArray[indexPath.row];
    
    cell.appModel = appModel;
    
    return cell;
}

// 当视图加载完成之后调用
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    
    // 修改 cell中的 size
    _flowLayout.itemSize = CGSizeMake(200, 200);
    
}


@end
