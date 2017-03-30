//
//  UIViewController+MTTHUD.h
//  MTTV2EX
//
//  Created by lyleKP on 2017/3/30.
//  Copyright © 2017年 lyle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTTBaseModel.h"
@class MTTResponse;
@interface UIViewController (MTTHUD)

- (void)mtt_showHUD;

- (void)mtt_showHUDFromTitle:(NSString *)title;

- (void)mtt_hideHUD;

- (void)mtt_setHUDTitle:(NSString *)title;

- (void)mtt_showScreenHUD;

- (void)mtt_showScreenHUDWithTitle:(NSString *)title;

- (void)mtt_showTip:(NSString *)tips;

- (void)mtt_showTip:(NSString *)tips finished:(VoidBlock)finished;

- (void)mtt_showResult:(MTTResponse *)result;

@end
