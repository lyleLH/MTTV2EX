//
//  MTTRequest.m
//  MTTV2EX
//
//  Created by lyleKP on 2017/3/30.
//  Copyright © 2017年 lyle. All rights reserved.
//

#import "MTTRequest.h"
#import "MTTAPIResource.h"
@implementation MTTRequest


- (instancetype)init{
    if (self = [super init]) {
        _HTTPMethod = MTTHTTPMethodGet;
    }
    
    return self;
}

- (instancetype)initWithClassMethod:(MTTRestfulAPIMethod)apiMethod
                         parameters:(NSDictionary *)parameters
                          className:(NSString *)className
                         HTTPMethod:(MTTHTTPMethod)HTTPMethod
                       responseType:(MTTResponseType)type{
    if (self = [self init]) {
        _apiMethod = apiMethod;
        _parameters = parameters;
        _HTTPMethod = HTTPMethod;
        _responseType = type;
        _className = className;
    }
    return self;
}

- (NSString *)httpMethodSting{
    return @[@"GET", @"POST"][_HTTPMethod];
}


@end
