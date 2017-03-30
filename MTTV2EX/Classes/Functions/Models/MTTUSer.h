//
//  MTTUSer.h
//  MTTV2EX
//
//  Created by lyleKP on 2017/3/30.
//  Copyright © 2017年 lyle. All rights reserved.
//

#import "MTTBaseModel.h"

@interface MTTUSer : MTTBaseModel
@property (nonatomic,strong ) NSString *Authorization;
+ (instancetype)shareInstance;

- (BOOL)isLoggedIn;

@end
