//
//  MTTAPIResource.m
//  MTTV2EX
//
//  Created by lyleKP on 2017/3/30.
//  Copyright © 2017年 lyle. All rights reserved.
//

#import "MTTAPIResource.h"

@implementation MTTAPIResource

+ (NSString *)getClassMethod:(MTTRestfulAPIMethod)apiMethod {
    switch (apiMethod) {
        case kAPIMethod_Login:
            return @"";
            break;
        default:
            break;
    }
    
    return @"";
}

@end
