//
//  MTTResponse.m
//  MTTV2EX
//
//  Created by lyleKP on 2017/3/30.
//  Copyright © 2017年 lyle. All rights reserved.
//

#import "MTTResponse.h"

@implementation MTTResponse
- (instancetype)initWithResult:(NSDictionary *)result request:(MTTRequest *)request {
    self = [super init];
    if(self){
        
        
        
    }
    return self;
}



- (BOOL)isSuccess {
    
    return _code ==0;
}
- (BOOL)isLogout {
    return _code == 1006;
}
@end
