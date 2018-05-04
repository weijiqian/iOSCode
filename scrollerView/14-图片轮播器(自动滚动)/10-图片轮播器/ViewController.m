//
//  ViewController.m
//  10-图片轮播器
//
//  Created by apple on 15/11/6.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "ViewController.h"

#define kScrollViewSize (_scrollView.frame.size)

#define kImageCount 5

@interface ViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setupUI];
}

#pragma mark -
#pragma mark -  设置UI界面
- (void)setupUI {
    
    // 设置控制器成为scrollView的代理
    _scrollView.delegate = self;
    
    [self setupScrollView];
    
    
    [self setupPageControll];
    
    // 创建计时器
    [self initImageTimer];
}

#pragma mark -
#pragma mark -  创建计时器
- (void)initImageTimer {
    /**
     scheduled 计划，安排
     interval : 间隔
     target :  一般指控制器
     selector: 方法
     userInfo : 用户自定义的参数
     repeats: 重复
     
     每隔1秒钟 调用 控制器的  didClickButton： 方法， 传递的参数为nil
     
     一旦创建就会立即生效
     
     在使用timer的时候， 如果调用了 invalidate方法， 那么这个计时器就不会再次生效
     重新创建新的timer
     */
    _timer = [NSTimer scheduledTimerWithTimeInterval:2
                                              target:self
                                            selector:@selector(didClickButton:)
                                            userInfo:nil
                                             repeats:YES];
    
   // [_timer fire];  调用fire ， 这个计时器会立即执行， 不会等待 interval 设置的时间
    
    NSRunLoop *mainLoop = [NSRunLoop mainRunLoop];
    
    
    [mainLoop addTimer:_timer forMode:NSRunLoopCommonModes];
    
}

/**
 在开始拖拽的时候， 把计时器停止
 
 invalidate 无效的意思
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    // 让计时器无效
    [_timer invalidate];
}

/**
 当停止拖拽的时候， 让计时器开始工作
 手指离开scrollView的时候
 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
   [_timer fire];
    
    [self initImageTimer];
}


#pragma mark -
#pragma mark -  scrollView设置
- (void)setupScrollView {
    // 取出scrollView的size
//    CGSize scrollViewSize = _scrollView.frame.size;
    
    for (int i = 0; i < kImageCount; i++) {
        // 计算imageView的x值
        CGFloat imageViewX = i * kScrollViewSize.width;
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageViewX, 0, kScrollViewSize.width, kScrollViewSize.height)];
        
        // 设置图片
//        imageView.image =[UIImage imageNamed:@"img_01"];
        // 拼接图片的名称
        NSString *imageName = [NSString stringWithFormat:@"img_%02d",i + 1];
        
        imageView.image = [UIImage imageNamed:imageName];
        
        
        // 添加到scrollView
        [_scrollView addSubview:imageView];
    }
    
    // 设置 scrollView的contentSize
    _scrollView.contentSize = CGSizeMake(kImageCount * kScrollViewSize.width, 0);
    
    // 隐藏滚动指示器
    _scrollView.showsHorizontalScrollIndicator = NO;
    
    // scrollView的分页效果 (根据scrollView的宽度进行分页的)
    _scrollView.pagingEnabled = YES;
    
}


#pragma mark -
#pragma mark -  设置pageControll
- (void)setupPageControll {
    
    // 设置总共有几个点
    _pageControl.numberOfPages = kImageCount;
    
    // 设置指示器的颜色
    // 非当前的指示器
    _pageControl.pageIndicatorTintColor = [UIColor grayColor];
    
    // 设置当前指示器的颜色
    _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    
    // 设置当前在第几个点 , 取值范围是 0 .. numberOfPages - 1
    // 设置的currentPage如果超出最大的范围， 就在最后一个显示
    // 设置的currentPage如果超出最小的范围 就在第一个显示
    _pageControl.currentPage = 0;
}


#pragma mark -
#pragma mark -  当scrollView停止减速的时候调用
// Decelerating 减速
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    // currentPage = scrollView.contentOffset.x / kScrollViewSize.width
    
    _pageControl.currentPage = scrollView.contentOffset.x / kScrollViewSize.width;
}

- (IBAction)didClickButton:(id)sender {
    /**
     1. 取出scrollView的contentOffset
     2. 取出 pagecontroll 的 currentPage
     3. 进行修改
     4. 赋值回去
     */
    
    // 1. 取出 contentOffset
    CGPoint offset = _scrollView.contentOffset;
    
    // 2. currentPage
    NSInteger currentPage = _pageControl.currentPage;
    
    // 3. 进行修改
    
    if (currentPage == 4) {
        // 到了最后一张, 再次点击的时候， 到第一张图片的位置
        // currentPage 修改为0
        currentPage = 0;
        
        // 修改 scrollView的contentOffset
        offset = CGPointZero;
        
    } else {
        
        currentPage += 1;
        
        offset.x += kScrollViewSize.width;
    }
    
    // 4. 赋值回去
    _pageControl.currentPage = currentPage;
    [_scrollView setContentOffset:offset animated:YES];
    
}





@end
