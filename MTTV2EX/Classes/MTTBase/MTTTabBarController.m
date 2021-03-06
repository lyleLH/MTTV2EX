//
//  MTTTabBarController.m
//  MTTV2EX
//
//  Created by lyleKP on 2017/3/30.
//  Copyright © 2017年 lyle. All rights reserved.
//

#import "MTTTabBarController.h"
#import "MTTTopicViewController.h"
#import "MTTNodeViewController.h"
#import "MTTMessageViewController.h"
#import "MTTAboutMeViewController.h"

#import "MTTNavigationViewController.h"
#import "RKSwipeBetweenViewControllers.h"
@interface MTTTabBarController ()<UITabBarControllerDelegate>

@end

@implementation MTTTabBarController

- (instancetype)init {
    self = [super init];
    if(self){
        self.delegate = self;
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    RKSwipeBetweenViewControllers *nav_tweet = [RKSwipeBetweenViewControllers newSwipeBetweenViewControllers];
    [nav_tweet.viewControllerArray addObjectsFromArray:@[[[MTTTopicViewController alloc] init],
                                                         [[MTTTopicViewController alloc] init],
                                                         [[MTTTopicViewController alloc] init],
                                                         [[MTTTopicViewController alloc] init]]];
    nav_tweet.buttonText = @[@"最热", @"最新", @"关注",@"收藏"];

    [self addChildViewController:nav_tweet andSetUpTabbarOfViewControllerWithTitle:nil andImage:@"tabbar_home" annSelectedImage:@"tabbar_home_selected" withNavgationContoller:NO];
     [self addChildViewController:[[MTTNodeViewController alloc] init] andSetUpTabbarOfViewControllerWithTitle:nil andImage:@"tabbar_order" annSelectedImage:@"tabbar_order_selected" withNavgationContoller:YES];
     [self addChildViewController:[[MTTMessageViewController alloc] init] andSetUpTabbarOfViewControllerWithTitle:nil andImage:@"tabbar_news" annSelectedImage:@"tabbar_news_selected" withNavgationContoller:YES];
     [self addChildViewController:[[MTTAboutMeViewController alloc] init] andSetUpTabbarOfViewControllerWithTitle:nil andImage:@"tabbar_me" annSelectedImage:@"tabbar_me_selected" withNavgationContoller:YES];
    
}

/**
 *  设置控制器tabbar的样式
 *
 *  @param title             标题
 *  @param imageName         正常状态图片名字
 *  @param selectedImageName 选中状态图片名字
 */
- (void)addChildViewController:(UIViewController *)childViewController
andSetUpTabbarOfViewControllerWithTitle:(NSString *)title
                      andImage:(NSString *)imageName
              annSelectedImage:(NSString * )selectedImageName
        withNavgationContoller:(BOOL)navTag;


{
    
    //改变tabbar 线条颜色
    CGRect rect = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, .5);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,
                                   [UIColor colorWithHex:0xcccccc].CGColor);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.tabBar setShadowImage:img];
    [self.tabBar setBackgroundImage:[[UIImage alloc]init]];
    //改变背景为白色
    UIView *bgView = [[UIView alloc] initWithFrame:self.tabBar.bounds];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.tabBar insertSubview:bgView atIndex:0];
    self.tabBar.opaque = YES;
    
#if 0
    childViewController.tabBarItem.title = title;
    
    childViewController.navigationItem.title = title;
    
    //正常文字
    NSMutableDictionary * textNomalAttributesDic = [[NSMutableDictionary alloc] init];
    textNomalAttributesDic[NSForegroundColorAttributeName] = [UIColor kp_suggestiveGrayColor];
    [childViewController.tabBarItem setTitleTextAttributes:textNomalAttributesDic forState:UIControlStateNormal];
    //选中文字
    NSMutableDictionary * textSelectedAttributesDic = [[NSMutableDictionary alloc] init];
    textSelectedAttributesDic[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [childViewController.tabBarItem setTitleTextAttributes:textSelectedAttributesDic forState:UIControlStateSelected];
#endif
    // 即使使用的图片有渲染颜色，也会被渲染成系统蓝色
    //    self.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_s1"];
    //     childViewController.tabBarItem.image = [UIImage imageNamed:imageName];
    
    //使用图片不渲染
    UIImage * Image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    childViewController.tabBarItem.image = Image;
    
    UIImage * selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    childViewController.tabBarItem.selectedImage = selectedImage;
    
    CGFloat offset = 5.0;
    childViewController.tabBarItem.imageInsets = UIEdgeInsetsMake(offset, 0, - offset, 0);
    
    if(navTag) {
        MTTNavigationViewController *nav = [[MTTNavigationViewController alloc] initWithRootViewController:childViewController];
        [self addChildViewController:nav];
    }else {
        [self addChildViewController:childViewController];
    }
    
    
}

#pragma mark --自定义tabbar界面切换
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    if(self.selectedViewController != viewController) {
        //        [tabBarController.view.layer addAnimation:[CATransition getAnimation:3 subtype:2] forKey:nil];
        return YES;
    }
    return NO;
    
}

@end
