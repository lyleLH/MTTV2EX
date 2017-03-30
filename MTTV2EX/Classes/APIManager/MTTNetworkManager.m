//
//  MTTNetworkManager.m
//  MTTV2EX
//
//  Created by lyleKP on 2017/3/30.
//  Copyright © 2017年 lyle. All rights reserved.
//

#import "MTTNetworkManager.h"
#import "MTTRequest.h"
#import <AFNetworking.h>
#import "MTTUSer.h"
static CGFloat kTimeoutInterval = 30.0f;
static NSString *kDefaultErrorTips = @"网络异常，请检查网络是否正常";

@implementation MTTNetworkManager

- (instancetype)init{
    if (self = [super  init]) {

    }
    
    return self;
}

+ (MTTNetworkManager *)sharedManager{
    static MTTNetworkManager *sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

- (void)requestWithClassMethod:(MTTRestfulAPIMethod)classMethod
                    parameters:(NSDictionary *)parameters
                     className:(NSString *)className
                 responseBlock:(MTTResponseBlock)responseBlock {
    
    return [self requestWithClassMethod:classMethod parameters:parameters className:className HTTPMethod:MTTHTTPMethodGet responseBlock:responseBlock responseType:MTTResponseTypeList];
    
}
- (void)requestWithClassMethod:(MTTRestfulAPIMethod)classMethod parameters:(NSDictionary *)parameters className:(NSString *)className  HTTPMethod:(MTTHTTPMethod)HTTPMethod responseBlock:(MTTResponseBlock)responseBlock  responseType:(MTTResponseType)type {
    MTTRequest *request = [[MTTRequest alloc] initWithClassMethod:classMethod parameters:parameters className:className HTTPMethod:HTTPMethod responseType:type];
    
    [self request:request responseBlock:responseBlock];
}



- (void)request:(MTTRequest *)request
  responseBlock:(MTTResponseBlock)responseBlock{
    
    NSString *apiMethod = request.httpMethodSting;
    
    NSString *URLString = request.urlString && request.urlString.length > 0 ? request.urlString : [MTTAPIResource getClassMethod:request.apiMethod];

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    // 设置超时时间
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = kTimeoutInterval;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];

    manager.requestSerializer.stringEncoding = NSUTF8StringEncoding;
    __block NSMutableDictionary *param = [[NSMutableDictionary  alloc] initWithDictionary:request.parameters];
    __block NSMutableURLRequest *urlRequest = [manager.requestSerializer requestWithMethod:apiMethod URLString:[[NSURL URLWithString:URLString relativeToURL:manager.baseURL] absoluteString] parameters:param error:nil];
    
    __block NSURLSessionDataTask *task = [manager dataTaskWithRequest:urlRequest completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (responseBlock) {

            MTTLog(@"%@---\n %@ \n %@\n %@\n %@\n ",
                   apiMethod,
                   error?@"Error":@"Success",
                   URLString,
                   [param mtt_description],
                   error ? error:[responseObject mtt_description]
                   );
            
            MTTResponse *response = nil;
            if (error) {
                response = [[MTTResponse alloc] init];

                response.code = MTRequestHTTPFailed;
                response.message = kDefaultErrorTips;
            }else{
                response = [[MTTResponse alloc] initWithResult:responseObject request:request];
            }
            
            
            if ([response isLogout]) {
                [[NSNotificationCenter defaultCenter] postNotificationName:KPLandingAnomaly object:nil];
            }else if (request.showTips&& [URLString rangeOfString:@"AutoMessage"].location == NSNotFound&& [URLString rangeOfString:@"AutoMsg"].location == NSNotFound) {
                
                [[UIViewController mtt_topViewController] mtt_showResult:response];
            }
            
            responseBlock(response);
        }
    }];
    [task resume];

}

+ (void)cancelOperationsWithClass:(id)Class{
    [[AFHTTPSessionManager manager].operationQueue cancelAllOperations];
}


@end
