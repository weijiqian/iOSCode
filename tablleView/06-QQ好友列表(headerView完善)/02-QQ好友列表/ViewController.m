//
//  ViewController.m
//  02-QQ好友列表
//
//  Created by apple on 15/11/14.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "ViewController.h"
#import "QQCell.h"
#import "GroupsModel.h"
#import "FriendsModel.h"
#import "HeaderView.h"


@interface ViewController ()<HeaderViewDelegate>

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ViewController

#pragma mark -
#pragma mark -  懒加载数据
- (NSArray *)dataArray {
    if (nil == _dataArray) {
        
        // 路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"friends.plist" ofType:nil];
        
        // 读取内容
        NSArray *tempArray = [NSArray arrayWithContentsOfFile:path];
        
        // 创建可变数组
        NSMutableArray *mutable = [NSMutableArray array];
        
        // 字典转模型
        for (NSDictionary *dict in tempArray) {
            GroupsModel *groupModel = [GroupsModel groupsModelWith:dict];
            
            [mutable addObject:groupModel];
        }
        
        // 赋值给 _dataArray
        
        _dataArray = mutable;
        
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 到tableView注册 一个 重用的cell
    
    /**
     
     NibName ： xib 的文件名
     bundle： 传空就默认是当前的bundle
     
     使用自定义cell， 并没有 和  xib进行关联
      self.tableView registerClass: forCellReuseIdentifier:
     
     是针对于使用 xib 自定义cell的时候使用
     [self.tableView registerNib:nib forCellReuseIdentifier:@"QQCell"];
     
     
     通过注册cell 之后， 在返回cell的时候， 可以省略掉为nil 判断
     */
    UINib *nib = [UINib nibWithNibName:@"QQCell" bundle:nil];
    
    [self.tableView registerNib:nib forCellReuseIdentifier:@"QQCell"];
    
    
    // 没有分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
   
}

// 组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

// 每组 的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    GroupsModel *groupModel = self.dataArray[section];
    
    // 反回的行数里面， 要么是0  要么是 groupModel.friends.count

    return groupModel.isExplain ? groupModel.friends.count : 0;
}

// 每一行的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 重用标识符
    static NSString *identifier = @"QQCell";
    
    
    // 到缓存池中去找
    QQCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    // 取出GroupsModel
    GroupsModel *groupModel = self.dataArray[indexPath.section];
    
    // 取出 FriendsModel
    FriendsModel *friends = groupModel.friends[indexPath.row];
    
    // 为cell赋值
    
    cell.friendsModel = friends;
    
    
    return cell;
    
}

#pragma mark -
#pragma mark -  返回section的 headerView
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    // 1. 定义一个重用标识符
    static NSString *headerIdentifier = @"HeaderView";
    
    // 2. 到缓存池中去找
    HeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerIdentifier];
    
    // 3. 判断是否为空
    if (nil == headerView) {
        headerView = [[HeaderView alloc] initWithReuseIdentifier:headerIdentifier];
        
        headerView.delegate = self;

    }
    
    // 4. 对headerView进行赋值， 然后返回
    // 取出groupModel
    GroupsModel *model = self.dataArray[section];
    
    headerView.groupModel = model;
    
    // 为headerView设置tag 记录是哪一组的
    headerView.tag = section;
    
    // 当数据刷新的时候， 会调用这个方法刷新数据
    headerView.rotageImageView = model.isExplain;
    
    return headerView;
}

#pragma mark -
#pragma mark -  实现headerView的代理方法
- (void)headerView:(HeaderView *)headerView didClickButton:(UIButton *)button {
    // 1. 旋转 图片
    headerView.rotageImageView = YES;
    
    /**
     2. 展开
     修改对应组的 groupModel 中的 expalin ＝ YES； 展开
     
     */
    
    // 在viewForHeaderInSection: 这个方法里 为headerView设置的tag 就是对应的组号
    NSInteger section = headerView.tag;
    
    // 取出对应groupModel
    GroupsModel *groupModel = self.dataArray[section];
    
    // 修改 groupModel 中的  explain的属性为YES
    groupModel.explain = !groupModel.isExplain;
    
    // 刷新数据
//    [self.tableView reloadData];
    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:section];
    
    [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
}


#pragma mark -
#pragma mark -  反回section header 的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}



#pragma mark -
#pragma mark -  隐藏statusbar
- (BOOL)prefersStatusBarHidden {
    return YES;
}
@end
