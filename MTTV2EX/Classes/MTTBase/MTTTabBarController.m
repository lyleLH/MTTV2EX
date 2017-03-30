//
//  MTTTabBarController.m
//  MTTV2EX
//
//  Created by lyleKP on 2017/3/30.
//  Copyright © 2017年 lyle. All rights reserved.
//

#import "MTTTabBarController.h"
#import "MTTHomeViewController.h"
#import "MTTNavigationViewController.h"
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

    [self addChildViewController:[[MTTHomeViewController alloc] init] andSetUpTabbarOfViewControllerWithTitle:@"首页" andImage:@"tabbar_home" annSelectedImage:@"tabbar_home_selected" withNavgationContoller:YES];
     [self addChildViewController:[[MTTHomeViewController alloc] init] andSetUpTabbarOfViewControllerWithTitle:@"首页" andImage:@"tabbar_news" annSelectedImage:@"tabbar_news_selected" withNavgationContoller:YES];
     [self addChildViewController:[[MTTHomeViewController alloc] init] andSetUpTabbarOfViewControllerWithTitle:@"首页" andImage:@"tabbar_order" annSelectedImage:@"tabbar_order_selected" withNavgationContoller:YES];
     [self addChildViewController:[[MTTHomeViewController alloc] init] andSetUpTabbarOfViewControllerWithTitle:@"首页" andImage:@"tabbar_me" annSelectedImage:@"tabbar_me_selected" withNavgationContoller:YES];
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
    
    // 即使使用的图片有渲染颜色，也会被渲染成系统蓝色
    //    self.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_s1"];
    //     childViewController.tabBarItem.image = [UIImage imageNamed:imageName];
    
    //使用图片不渲染
    UIImage * Image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    childViewController.tabBarItem.image = Image;
    
    UIImage * selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    childViewController.tabBarItem.selectedImage = selectedImage;
    
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
