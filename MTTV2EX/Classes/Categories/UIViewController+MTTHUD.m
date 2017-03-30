//
//  UIViewController+MTTHUD.m
//  MTTV2EX
//
//  Created by lyleKP on 2017/3/30.
//  Copyright © 2017年 lyle. All rights reserved.
//

#import "UIViewController+MTTHUD.h"
#import <MBProgressHUD.h>
#import "MTTResponse.h"
#import <UIView+YYAdd.h>
#import <YYTextKeyboardManager.h>
#import "UIView+Toast.h"

#import "MTTBaseModel.h"
@implementation UIViewController (MTTHUD)
- (void)mtt_showHUD{
    [self mtt_showHUDFromTitle:@""];
}

- (void)mtt_showTip:(NSString *)tips{
    [self mtt_showTip:tips finished:nil];
}

- (void)mtt_showTip:(NSString *)tips finished:(VoidBlock)finished{
    if (tips.length == 0) {
        if (finished) {
            finished();
        }
        return;
    }
    
    CGFloat time = 0;
    if ([[MBProgressHUD allHUDsForView:self.view] count] > 0) {
        time = .5;
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        id position = CSToastPositionCenter;
        CGFloat height = [YYTextKeyboardManager defaultManager].keyboardFrame.size.height;
        if (height > 0) {
            position = [NSValue valueWithCGPoint:CGPointMake([UIScreen mainScreen].bounds.size.width/2, (CGRectGetHeight(self.view.frame) - height)/2)];
        }
        [self.view makeToast:tips duration:2.0 position:position];
        
        if (finished) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                if (finished) {
                    finished();
                }
            });
        }
    });
}

- (void)mtt_showResult:(MTTResponse *)result{
    if (![result isSuccess]) {
        NSString *message = result.code == MTRequestHTTPFailed ? @"网络请求失败" : result.message;
        [self mtt_showTip:message];
    }
}

- (void)mtt_setHUDTitle:(NSString *)title{
    [MBProgressHUD HUDForView:self.view].label.text = title;
}

- (void)mtt_showScreenHUD{
    [self mtt_showScreenHUDWithTitle:@"加载中..."];
}

- (void)mtt_showScreenHUDWithTitle:(NSString *)title{
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:self.view];
    HUD.mode = MBProgressHUDModeCustomView;
    //    HUD.opacity = 1;
    HUD.bezelView.color = [UIColor whiteColor];
    HUD.bezelView.layer.cornerRadius = 0;
    HUD.margin = 0;
    HUD.minShowTime = .3;
    HUD.removeFromSuperViewOnHide = YES;
    //    HUD.graceTime = .5;
    //    HUD.taskInProgress = YES;
    
    UIView *customView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds)-44)];
    customView.backgroundColor = [UIColor colorWithWhite:1 alpha:.8];
    
    NSMutableArray *images = @[].mutableCopy;
    for (int i = 1; i<13; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"loading_%d",i]];
        if (image) {
            [images addObject:image];
        }
    }
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.size = [(UIImage *)[images firstObject] size];
    imageView.center = CGPointMake(customView.width/2, customView.height/2);
    imageView.animationImages = images;
    imageView.animationDuration = images.count * .1f;
    [imageView startAnimating];
    [customView addSubview:imageView];
    
    HUD.customView = customView;
    [self.view addSubview:HUD];
    [HUD showAnimated:YES];
    
}

- (void)mtt_showHUDFromTitle:(NSString *)title{
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        if ([[MBProgressHUD allHUDsForView:self.view] count] == 0) {
            MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self.view];
            hud.mode = MBProgressHUDModeCustomView;
            hud.removeFromSuperViewOnHide = YES;
            hud.minShowTime = .3;
            NSMutableArray *images = @[].mutableCopy;
            for (int i = 1; i<13; i++) {
                UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"loading_%d",i]];
                if (image) {
                    [images addObject:image];
                }
            }
            UIImageView *imageView = [[UIImageView alloc] init];
            imageView.size = [(UIImage *)[images firstObject] size];
            imageView.center = CGPointMake(hud.width/2, hud.height/2);
            imageView.animationImages = images;
            imageView.animationDuration = images.count * .1f;
            [imageView startAnimating];
            hud.customView = imageView;
            
            [self.view addSubview:hud];
            
            [hud showAnimated:YES];
            
            //            [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        }
        
        //        [self setHUDTitle:title];
    });
}

- (void)mtt_hideHUD{
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    });
}

@end
