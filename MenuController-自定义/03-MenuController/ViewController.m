//
//  ViewController.m
//  03-MenuController
//
//  Created by xiaomage on 15/8/3.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "ViewController.h"
#import "XMGLabel.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet XMGLabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
    [self.webView loadHTMLString:@"<div style=\"color:red;\">哈哈哈哈</div>" baseURL:nil];
    
    [self.label addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelClick)]];
}

- (void)labelClick
{
    // 1.label要成为第一响应者(作用是:告诉UIMenuController支持哪些操作, 这些操作如何处理)
    [self.label becomeFirstResponder];
    
    // 2.显示MenuController
    UIMenuController *menu = [UIMenuController sharedMenuController];
    
    // 添加MenuItem
    UIMenuItem *ding = [[UIMenuItem alloc] initWithTitle:@"顶" action:@selector(ding:)];
    UIMenuItem *replay = [[UIMenuItem alloc] initWithTitle:@"回复" action:@selector(replay:)];
    UIMenuItem *report = [[UIMenuItem alloc] initWithTitle:@"举报" action:@selector(report:)];
    menu.menuItems = @[ding, replay, report];
    
    [menu setTargetRect:self.label.bounds inView:self.label];
    [menu setMenuVisible:YES animated:YES];
}

- (void)ding:(UIMenuController *)menu
{
    NSLog(@"%s %@", __func__ , menu);
}

- (void)replay:(UIMenuController *)menu
{
    NSLog(@"%s %@", __func__ , menu);
}

- (void)report:(UIMenuController *)menu
{
    NSLog(@"%s %@", __func__ , menu);
}
@end
