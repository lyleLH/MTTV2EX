//
//  MTTNetworkManager.h
//  MTTV2EX
//
//  Created by lyleKP on 2017/3/30.
//  Copyright © 2017年 lyle. All rights reserved.
//

#import "MTTBaseModel.h"
#import "MTTResponse.h"
@class MTTRequest;
@class MTTHttpProxy;

@interface MTTNetworkManager : MTTBaseModel
+ (MTTNetworkManager *)sharedManager;
- (void)request:(MTTRequest *)request
  responseBlock:(MTTResponseBlock)responseBlock;

+ (void)cancelOperationsWithClass:(id)Class;



@end
