//
//  MTTResponse.h
//  MTTV2EX
//
//  Created by lyleKP on 2017/3/30.
//  Copyright © 2017年 lyle. All rights reserved.
//

#import "MTTBaseModel.h"
#import "MTTAPIResource.h"
typedef NS_ENUM(NSUInteger, KPResponseType) {
    MTTResponseObject = 0,
    MTTResponseArray = 1,
};

@class MTTRequest;

@class MTTResponse;
typedef void (^MTTResponseBlock)(MTTResponse *response);
typedef void (^MTTResponseFinishedBlock)(MTTResponse *response, BOOLBlock finished);


@interface MTTResponse : MTTBaseModel

@property (assign, nonatomic) NSInteger code;

@property (copy, nonatomic) NSString *message;

@property (strong, nonatomic) NSDictionary *data;

/** 解析后的对象/数组 */
@property (strong, nonatomic) id result;

- (instancetype)initWithResult:(NSDictionary *)result request:(MTTRequest *)request;

- (BOOL)isSuccess;

- (BOOL)isLogout ;

@end
