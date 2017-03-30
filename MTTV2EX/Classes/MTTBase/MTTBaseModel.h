//
//  MTTBaseModel.h
//  MTTV2EX
//
//  Created by lyleKP on 2017/3/30.
//  Copyright © 2017年 lyle. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^BOOLBlock)(BOOL result);
typedef void (^VoidBlock)();
typedef void (^DictionaryBlock)(NSDictionary *result);
typedef void (^ArrayBlock)(NSArray *result);
typedef void (^StringBlock)(NSString *result);

@interface MTTBaseModel : NSObject

@end
