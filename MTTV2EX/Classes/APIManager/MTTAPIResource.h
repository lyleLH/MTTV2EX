//
//  MTTAPIResource.h
//  MTTV2EX
//
//  Created by lyleKP on 2017/3/30.
//  Copyright © 2017年 lyle. All rights reserved.
//

#import "MTTBaseModel.h"

typedef NS_ENUM(NSUInteger, MTRequestHTTPStatus){
    MTRequestHTTPSuccess = 0,
    MTRequestHTTPFailed = 9999,
};

typedef NS_ENUM(NSUInteger, MTTRestfulAPIMethod) {
    kAPIMethod_Login = 0,
};


@interface MTTAPIResource : MTTBaseModel

+(NSString *) getClassMethod:(MTTRestfulAPIMethod) apiMethod;

@end
