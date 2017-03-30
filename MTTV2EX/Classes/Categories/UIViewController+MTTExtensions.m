//
//  UIViewController+MTTExtensions.m
//  MTTV2EX
//
//  Created by lyleKP on 2017/3/30.
//  Copyright © 2017年 lyle. All rights reserved.
//

#import "UIViewController+MTTExtensions.h"
#import "AppDelegate.h"
@implementation UIViewController (MTTExtensions)

+ (UIViewController*)mtt_topViewController {
    
    return [self mtt_topViewControllerWithRootViewController:[(AppDelegate *)[[UIApplication sharedApplication] delegate] window].rootViewController];
}

+ (UIViewController*)mtt_topViewControllerWithRootViewController:(UIViewController*)rootViewController {
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController* tabBarController = (UITabBarController*)rootViewController;
        return [self mtt_topViewControllerWithRootViewController:tabBarController.selectedViewController];
    } else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController* navigationController = (UINavigationController*)rootViewController;
        return [self mtt_topViewControllerWithRootViewController:navigationController.visibleViewController];
    } else if (rootViewController.presentedViewController) {
        UIViewController* presentedViewController = rootViewController.presentedViewController;
        return [self mtt_topViewControllerWithRootViewController:presentedViewController];
    } else {
        return rootViewController;
    }
}

@end
