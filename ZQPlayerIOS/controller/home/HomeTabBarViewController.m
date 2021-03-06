//
//  HomeTabBarViewController.m
//  ZQPlayerIOS
//
//  Created by johnwu on 2019/1/6.
//  Copyright © 2019年 johnwu. All rights reserved.
//

#import "HomeTabBarViewController.h"
#import "HomeViewController.h"
#import "AmusementViewController.h"
#import "SubscribeViewController.h"
#import "DiscoverViewController.h"
#import "MineViewController.h"

@interface HomeTabBarViewController ()

@end

@implementation HomeTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    [self initConrtoller];
}


- (void)initConrtoller {
    NSArray *titleList = @[@"首页",@"娱乐",@"订阅",@"发现",@"我的"];
    NSArray *imageList = @[@"icon_home_normal",
                           @"icon_amusement_normal",
                           @"icon_subscribe_normal",
                           @"icon_discover_normal",
                           @"icon_mine_normal"];
    NSArray *selectedImageList = @[@"icon_home_selected",
                                   @"icon_amusement_selected",
                                   @"icon_subscribe_selected",
                                   @"icon_discover_selected",
                                   @"icon_mine_selected"];
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    homeVC.titleColorSelected = [UIColor colorWithHexString:@"#ffa200" alpha:1];
    //生命周期原因 要在这里设置
    
    AmusementViewController *amusementVC = [[AmusementViewController alloc] init];
    SubscribeViewController *subscribeVC = [[SubscribeViewController alloc] init];
    DiscoverViewController *discoverVC = [[DiscoverViewController alloc] init];
    MineViewController *mineVC = [[MineViewController alloc] init];
    
    NSArray *viewControllers = @[homeVC,amusementVC,subscribeVC, discoverVC, mineVC];
    
    NSMutableArray *viewControllersArray = [[NSMutableArray alloc] init];
    
    [viewControllers enumerateObjectsUsingBlock:^(UIViewController *viewController, NSUInteger idx, BOOL *stop)
     {
         NSString *title = titleList[idx];
         UIImage *image = [[UIImage imageNamed:imageList[idx]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
         UIImage *selectedImage = [[UIImage imageNamed:selectedImageList[idx]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
         
         UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:title image:image tag:idx];
         [item setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor blackColor]} forState:UIControlStateNormal];
         [item setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor blackColor]} forState:UIControlStateSelected];
         [item setSelectedImage:selectedImage];
         viewController.tabBarItem = item;
         
         [viewControllersArray addObject:viewController];
     }];
    
    self.viewControllers = viewControllersArray;
    self.tabBar.backgroundColor = [UIColor whiteColor];
}


- (void)viewDidAppear:(BOOL)animated{
    [[self navigationController] setNavigationBarHidden:true animated:false];
    NSLog(@" ViewController  %@", [self navigationController] );
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
