//
//  ViewController.m
//  09-简单微博
//
//  Created by apple on 15/11/10.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "ViewController.h"
#import "WeiboModel.h"
#import "WeiboCell.h"
#import "ContentFrameModel.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ViewController


#pragma mark -
#pragma mark -  懒加载数据
- (NSArray *)dataArray {
    if (nil == _dataArray) {
        
        // 路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"weibo.plist" ofType:nil];
        // 读取
        NSArray *tempArray = [NSArray arrayWithContentsOfFile:path];
        
        // 创建可变数组
        NSMutableArray *mutable = [NSMutableArray array];
        
        // 转为字典存入可变数组
        for (NSDictionary *dict in tempArray) {
            WeiboModel *model = [WeiboModel weiboModelWithDict:dict];
            
            // 在进行字典转模型的时候， 把weiboModel赋值给 contentFrameModel, 用来计算所有控件的frame和cell的高度
            ContentFrameModel *frameModel = [[ContentFrameModel alloc] init];
            frameModel.weiboModel = model;
            
            
            [mutable addObject:frameModel];
        }
        
        // 把可变数组赋值给 _dataArray
        _dataArray = mutable;
        
    }
    return _dataArray;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置talbeView cell的 行高
    
//    self.tableView.rowHeight = 500;
    
}

// 组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// 行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

// 每一行的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 定义重用标识符
    static NSString *identifier = @"weiboCell";
    
    // 到缓存池中去取
    WeiboCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    // 进行判断
    if (nil == cell) {
        cell = [[WeiboCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    // 给cell 传递数据 , contentFrameModel 包含了 微博的数据(weiboModel), 所有控件的frame
    ContentFrameModel *contentFrameModel = self.dataArray[indexPath.row];
    
    cell.contentFrameModel = contentFrameModel;
    
    
    return cell;
}

#pragma mark -
#pragma mark -  返回cell行高的代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 要返回所有cell的行高
    // 取出contentFrameModel
    ContentFrameModel *frameModel = self.dataArray[indexPath.row];
    
    
    return frameModel.cellHeight;
}


@end
