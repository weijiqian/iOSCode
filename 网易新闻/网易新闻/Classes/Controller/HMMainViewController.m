//
//  HMMainViewController.m
//  网易新闻
//
//  Created by apple on 14-7-25.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HMMainViewController.h"
#import "HMLeftMenu.h"
#import "HMRightMenuController.h"
#import "HMNavigationController.h"
#import "HMNewsViewController.h"
#import "HMReadingViewController.h"
#import "HMTitleView.h"

#define HMNavShowAnimDuration 0.25
#define HMCoverTag 100
#define HMLeftMenuW 150
#define HMLeftMenuH 300
#define HMLeftMenuY 50

@interface HMMainViewController () <HMLeftMenuDelegate>
/**
 *  正在显示的导航控制器
 */
@property (nonatomic, weak) HMNavigationController *showingNavigationController;
@property (nonatomic, strong) HMRightMenuController *rightMenuVc;
@property (nonatomic, weak) HMLeftMenu *leftMenu;
@end

@implementation HMMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.创建子控制器
    [self setupAllChildVcs];
    
    // 2.添加左菜单
    [self setupLeftMenu];
    
    // 3.添加右菜单
    [self setupRightMenu];
}

/**
 *  添加右菜单
 */
- (void)setupRightMenu
{
    //右侧内容过多,就用控制器
    HMRightMenuController *rightMenuVc = [[HMRightMenuController alloc] init];
    rightMenuVc.view.x = self.view.width - rightMenuVc.view.width;
    [self.view insertSubview:rightMenuVc.view atIndex:1];
    self.rightMenuVc = rightMenuVc;
}

/**
 *  添加左菜单
 */
- (void)setupLeftMenu
{
    //左边内容少,就用view.
    HMLeftMenu *leftMenu = [[HMLeftMenu alloc] init];
    leftMenu.delegate = self;
    leftMenu.height = HMLeftMenuH;
    leftMenu.width = HMLeftMenuW;
    leftMenu.y = HMLeftMenuY;
    [self.view insertSubview:leftMenu atIndex:1];
    self.leftMenu = leftMenu;
}

/**
 *  创建子控制器
 */
- (void)setupAllChildVcs
{
    // 1.新闻控制器
    HMNewsViewController *news = [[HMNewsViewController alloc] init];
    [self setupVc:news title:@"新闻"];
    
    // 2.订阅控制器
    HMReadingViewController *reading = [[HMReadingViewController alloc] init];
    [self setupVc:reading title:@"订阅"];
    
    // 3.图片控制器
    UIViewController *photo = [[UIViewController alloc] init];
    [self setupVc:photo title:@"图片"];
    
    // 4.视频控制器
    UIViewController *video = [[UIViewController alloc] init];
    [self setupVc:video title:@"视频"];
    
    // 5.跟帖控制器
    UIViewController *comment = [[UIViewController alloc] init];
    [self setupVc:comment title:@"跟帖"];
    
    // 6.电台控制器
    UIViewController *radio = [[UIViewController alloc] init];
    [self setupVc:radio title:@"电台"];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

/**
 *  初始化一个控制器
 *
 *  @param vc      需要初始化的控制器
 *  @param title   控制器的标题
 */
- (void)setupVc:(UIViewController *)vc title:(NSString *)title
{
    // 1.设置背景色
    vc.view.backgroundColor = HMRandomColor;
    
    // 2.设置标题
    HMTitleView *titleView = [[HMTitleView alloc] init];
    titleView.title = title;
    vc.navigationItem.titleView = titleView;
    
    // 3.设置左右按钮
    vc.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"top_navigation_menuicon" target:self action:@selector(leftMenuClick)];
    vc.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"top_navigation_infoicon" target:self action:@selector(rightMenuClick)];
    
    // 4.包装一个导航控制器
    HMNavigationController *nav = [[HMNavigationController alloc] initWithRootViewController:vc];
    // 让newsNav成为self（HMMainViewController）的子控制器，能保证：self在，newsNav就在
    // 如果两个控制器互为父子关系，那么它们的view也应该互为父子关系
    [self addChildViewController:nav];
}

#pragma mark - 监听导航栏按钮点击
- (void)leftMenuClick
{
    self.leftMenu.hidden = NO;
    self.rightMenuVc.view.hidden = YES;
    
    [UIView animateWithDuration:HMNavShowAnimDuration animations:^{
        // 取出正在显示的导航控制器的view
        UIView *showingView = self.showingNavigationController.view;
        
        // 缩放比例
        CGFloat navH = [UIScreen mainScreen].bounds.size.height - 2 * HMLeftMenuY;
        CGFloat scale = navH / [UIScreen mainScreen].bounds.size.height;
        
        // 菜单左边的间距
        CGFloat leftMenuMargin = [UIScreen mainScreen].bounds.size.width * (1 - scale) * 0.5;
        CGFloat translateX = HMLeftMenuW - leftMenuMargin;
        
        CGFloat topMargin = [UIScreen mainScreen].bounds.size.height * (1 - scale) * 0.5;
        CGFloat translateY = HMLeftMenuY - topMargin;
        
        // 缩放
        CGAffineTransform scaleForm = CGAffineTransformMakeScale(scale, scale);
        // 平移  //依赖于上一个动画,就是两个动画都执行.
        CGAffineTransform translateForm = CGAffineTransformTranslate(scaleForm, translateX / scale, translateY / scale);
        
        showingView.transform = translateForm;
        
        // 添加一个遮盖
        UIButton *cover = [[UIButton alloc] init];
        cover.tag = HMCoverTag;
        [cover addTarget:self action:@selector(coverClick:) forControlEvents:UIControlEventTouchUpInside];
        cover.frame = showingView.bounds;
        [showingView addSubview:cover];
    }];
}

- (void)coverClick:(UIView *)cover
{
    [UIView animateWithDuration:HMNavShowAnimDuration animations:^{
        self.showingNavigationController.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [cover removeFromSuperview];
    }];
}

- (void)rightMenuClick
{
    self.leftMenu.hidden = YES;
    self.rightMenuVc.view.hidden = NO;
    
    [UIView animateWithDuration:HMNavShowAnimDuration animations:^{
        // 取出正在显示的导航控制器的view
        UIView *showingView = self.showingNavigationController.view;
        
        // 缩放比例
        CGFloat navH = [UIScreen mainScreen].bounds.size.height - 2 * HMLeftMenuY;
        CGFloat scale = navH / [UIScreen mainScreen].bounds.size.height;
        
        // 菜单左边的间距
        CGFloat leftMenuMargin = [UIScreen mainScreen].bounds.size.width * (1 - scale) * 0.5;
        CGFloat translateX = leftMenuMargin - self.rightMenuVc.view.width;
        
        CGFloat topMargin = [UIScreen mainScreen].bounds.size.height * (1 - scale) * 0.5;
        CGFloat translateY = HMLeftMenuY - topMargin;
        
        // 缩放
        CGAffineTransform scaleForm = CGAffineTransformMakeScale(scale, scale);
        // 平移
        CGAffineTransform translateForm = CGAffineTransformTranslate(scaleForm, translateX / scale, translateY / scale);
        
        showingView.transform = translateForm;
        
        // 添加一个遮盖
        UIButton *cover = [[UIButton alloc] init];
        cover.tag = HMCoverTag;
        [cover addTarget:self action:@selector(coverClick:) forControlEvents:UIControlEventTouchUpInside];
        cover.frame = showingView.bounds;
        [showingView addSubview:cover];
    } completion:^(BOOL finished) {
        [self.rightMenuVc didShow];
    }];
}

#pragma mark - HMLeftMenuDelegate
- (void)leftMenu:(HMLeftMenu *)menu didSelectedButtonFromIndex:(int)fromIndex toIndex:(int)toIndex
{
    // 0.移除旧控制器的view
    HMNavigationController *oldNav = self.childViewControllers[fromIndex];
    [oldNav.view removeFromSuperview];
    
    // 1.显示新控制器的view
    HMNavigationController *newNav = self.childViewControllers[toIndex];
    [self.view addSubview:newNav.view];
    
    // 2.设置新控制的transform跟旧控制器一样
    newNav.view.transform = oldNav.view.transform;
    // 设置阴影
    newNav.view.layer.shadowColor = [UIColor blackColor].CGColor;
    newNav.view.layer.shadowOffset = CGSizeMake(-3, 0);
    newNav.view.layer.shadowOpacity = 0.2;
    
    // 一个导航控制器的view第一次显示到它的父控件上时，如果transform的缩放值被改了，上面的20高度当时是不会出来
    
    // 2.设置当前正在显示的控制器
    self.showingNavigationController = newNav;
    
    // 3.点击遮盖
    [self coverClick:[newNav.view viewWithTag:HMCoverTag]];
}
@end
