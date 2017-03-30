//
//  MTTAPIResource.m
//  MTTV2EX
//
//  Created by lyleKP on 2017/3/30.
//  Copyright © 2017年 lyle. All rights reserved.
//

#import "MTTAPIResource.h"
static NSString * baseURL  = @"https://www.v2ex.com";

@implementation MTTAPIResource

+ (NSString *)getClassMethod:(MTTRestfulAPIMethod)apiMethod {
    switch (apiMethod) {
        case kAPIMethod_Login:
            return @"";
            break;
        case kAPIMethod_AllNode:
            return  [baseURL stringByAppendingString:@"/api/nodes/all.json"];
            break;
            
        default:
            break;
    }
    
    return @"";
}

@end
