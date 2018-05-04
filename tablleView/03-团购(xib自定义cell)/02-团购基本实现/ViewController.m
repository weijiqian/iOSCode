//
//  ViewController.m
//  02-团购基本实现
//
//  Created by apple on 15/11/10.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "ViewController.h"
#import "GrouponsModel.h"
#import "GrouponsCell.h"

@interface ViewController ()<UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ViewController

#pragma mark -
#pragma mark -  懒加载数据
- (NSMutableArray *)dataArray {
    if (nil == _dataArray) {
        // 先实例化dataArray
        _dataArray = [NSMutableArray array];
        
        // 路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"tgs.plist" ofType:nil];
        
        // 读取到临时数组
        NSArray *tempArray = [NSArray arrayWithContentsOfFile:path];
        
        // 把字典转为模型
        for (NSDictionary *dict in tempArray) {
            GrouponsModel *model = [GrouponsModel grouponsModelWidthDict:dict];
            
            [_dataArray addObject:model];
        }
    }
    
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 实例化一个tableView
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    
    // 设置控制器成为 tableView的 数据源代理
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
    
    // 设置cell的行高
    tableView.rowHeight = 90;
}


// 多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// 多少航
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

// 每行的内容

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 1. 定义一个重用标识符
    static NSString *identifier = @"groupons";
    
    // 2. 到缓存池中去找cell，（根据重用标识符）
    GrouponsCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    // 3. 进行判断， 如果找不到， 实例化新的cell
    if (nil == cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        
        // 从xib中加载cell
     cell = [[[NSBundle mainBundle] loadNibNamed:@"GrouponsCell" owner:nil options:nil] lastObject];
    }
    
    // 4. 设置cell中的数据
    GrouponsModel *model = self.dataArray[indexPath.row];
    
    cell.grouponsModel = model;
    
    // 设置cell数据
//    cell.imageView.image = [UIImage imageNamed:model.icon];
//    cell.textLabel.text = model.title;
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"$%@",model.price];

    
    return cell;
}



@end
