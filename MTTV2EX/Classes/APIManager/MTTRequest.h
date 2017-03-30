//
//  MTTRequest.h
//  MTTV2EX
//
//  Created by lyleKP on 2017/3/30.
//  Copyright © 2017年 lyle. All rights reserved.
//

#import "MTTBaseModel.h"
#import "MTTAPIResource.h"
typedef NS_ENUM(NSUInteger, MTTHTTPMethod) {
    MTTHTTPMethodGet = 0,
    MTTHTTPMethodPost = 1,
};



@interface MTTRequest : MTTBaseModel

@property (nonatomic, assign) MTTRestfulAPIMethod apiMethod;

@property (nonatomic, assign) MTTHTTPMethod HTTPMethod;

/**
 <#Description#>
 */
@property (nonatomic, copy) NSString *httpMethodSting;

/** 请求参数 */
@property (nonatomic, strong) NSDictionary *parameters;

@property (nonatomic, copy) NSString *urlString;

@property (nonatomic, copy) NSString *showTips;

@end
