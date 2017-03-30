//
//  NSObject+MTTCommonDefine.h
//  MTTV2EX
//
//  Created by lyleKP on 2017/3/30.
//  Copyright © 2017年 lyle. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef DEBUG
#define NSLog(args...) MTTLog(__FILE__,__LINE__,__PRETTY_FUNCTION__,args);
#else
#define NSLog(x...)
#endif

/**
 增强NSLog

 @param file <#file description#>
 @param lineNumber <#lineNumber description#>
 @param functionName <#functionName description#>
 @param format <#format description#>
 @param ... <#... description#>
 */
void MTTLog(const char *file, int lineNumber, const char *functionName, NSString *format, ...);


@interface NSObject (MTTCommonDefine)

/**
 增强的description方法

 @return <#return value description#>
 */
- (NSString*)mtt_description ;

@end
