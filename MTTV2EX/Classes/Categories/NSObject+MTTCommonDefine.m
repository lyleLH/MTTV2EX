//
//  NSObject+MTTCommonDefine.m
//  MTTV2EX
//
//  Created by lyleKP on 2017/3/30.
//  Copyright © 2017年 lyle. All rights reserved.
//

#import "NSObject+MTTCommonDefine.h"

@implementation NSObject (MTTCommonDefine)

void ExtendNSLog (const char *file, int lineNumber, const char *functionName, NSString *format, ...)
{
    // Type to hold information about variable arguments.
    va_list ap;
    
    // Initialize a variable argument list.
    va_start (ap, format);
    
    // NSLog only adds a newline to the end of the NSLog format if
    // one is not already there.
    // Here we are utilizing this feature of NSLog()
    if (![format hasSuffix: @"\n"])
    {
        format = [format stringByAppendingString: @"\n"];
    }
    
    NSString *body = [[NSString alloc] initWithFormat:format arguments:ap];
    
    // End using variable argument list.
    va_end (ap);
    
    NSString *fileName = [[NSString stringWithUTF8String:file] lastPathComponent];
    fprintf(stderr, "---Log---(%s)---(%s:%d)---%s",
            functionName, [fileName UTF8String],
            lineNumber, [body UTF8String]);
}



- (NSString*)mtt_description {
    NSString *desc = [self description];
    NSString *encode = [NSString stringWithCString:[desc cStringUsingEncoding:NSUTF8StringEncoding] encoding:NSNonLossyASCIIStringEncoding];
    //    NSString *encode = [[NSString alloc] initWithData:[desc dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES] encoding:NSNonLossyASCIIStringEncoding];
    
    if (!encode) {
        encode = [NSString stringWithCString:[desc cStringUsingEncoding:NSUTF8StringEncoding] encoding:NSWindowsCP1251StringEncoding];
    }
    return encode ? encode : desc;
}

@end
