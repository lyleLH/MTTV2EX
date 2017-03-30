//
//  MTTUSer.m
//  MTTV2EX
//
//  Created by lyleKP on 2017/3/30.
//  Copyright © 2017年 lyle. All rights reserved.
//

#import "MTTUSer.h"
static MTTUSer *_currentUser;

@implementation MTTUSer

+ (instancetype)shareInstance {
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
//        NSDictionary *dict = [kUD objectForKey:@"kCurrentUser"];
//        if (dict && [dict isKindOfClass:[NSDictionary class]]) {
//            _currentUser = [LHAppUser mj_objectWithKeyValues:dict];
//        }else{
//            _currentUser = [[MTTUSer alloc] init];
//        }
        _currentUser = [[MTTUSer alloc] init];
    });
    return _currentUser;
}

@end
