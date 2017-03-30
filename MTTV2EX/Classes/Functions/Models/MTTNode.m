//
//  MTTNode.m
//  MTTV2EX
//
//  Created by lyleKP on 2017/3/30.
//  Copyright © 2017年 lyle. All rights reserved.
//

#import "MTTNode.h"

@implementation MTTNode
- (instancetype)init{
    if (self = [super init]){
        self.ID = @"";
    }
    
    return self;
}

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"ID" : @"id"};
}


+ (void)allNode:(ArrayBlock)list {
    [[MTTNetworkManager sharedManager] requestWithClassMethod:kAPIMethod_AllNode parameters:@{} className:NSStringFromClass([self class]) responseBlock:^(MTTResponse *response) {
        list(response.result);
    }];
}



@end
