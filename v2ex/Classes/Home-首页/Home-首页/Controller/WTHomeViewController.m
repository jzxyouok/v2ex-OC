//
//  LBBHomeViewController.m
//  v2ex
//
//  Created by 无头骑士 GJ on 16/1/14.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//  首页控制器

#import "WTHomeViewController.h"
#import "WTTopicDetailViewController.h"

#import "WTURLConst.h"
#import "UIViewController+Extension.h"

#import "MJExtension.h"

@interface WTHomeViewController ()  
/** WTNode数组*/
@property (nonatomic, strong) NSArray<WTNode *>             *nodes;
@end

@implementation WTHomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 初始化导航栏
    [self setupNav];
    
    // 添加子控制器
    [self setupAllChildViewControllers];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 设置导航栏的View
    [self setTempNavImageView];
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear: animated];
    
    // 设置导航栏背景图片
    [self setNavBackgroundImage];
}

#pragma mark - Lazy method
#pragma mark nodes
- (NSArray<WTNode *> *)nodes
{
    if (_nodes == nil)
    {
        _nodes = [WTNode mj_objectArrayWithFilename: @"nodes.plist"];
    }
    return _nodes;
}

#pragma mark - 初始化导航栏
- (void)setupNav
{
    self.navigationItem.title = @"v2ex";
}

#pragma mark 添加子控制器
- (void)setupAllChildViewControllers
{
    for (WTNode *node in self.nodes)
    {
        WTTopicViewController *topicVC = [WTTopicViewController new];
        topicVC.title = node.name;
        topicVC.urlString = [WTHTTPBaseUrl stringByAppendingString: node.nodeURL];
        [self addChildViewController: topicVC];
    }
}

@end

