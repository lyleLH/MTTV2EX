//
//  NSObject+MTTCategory.m
//  MTTV2EX
//
//  Created by lyleKP on 2017/3/30.
//  Copyright © 2017年 lyle. All rights reserved.
//

#import "NSObject+MTTCategory.h"

@implementation NSObject (MTTCategory)

- (NSString *)mtt_bundleVersion
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

@end
