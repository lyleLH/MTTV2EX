//
//  MTTNode.h
//  MTTV2EX
//
//  Created by lyleKP on 2017/3/30.
//  Copyright © 2017年 lyle. All rights reserved.
//

#import "MTTBaseModel.h"

@interface MTTNode : MTTBaseModel

@property (nonatomic,copy)NSString *created;
@property (nonatomic,copy)NSString *footer;
@property (nonatomic,copy)NSString *header;
@property (nonatomic,copy)NSString *ID;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *title_alternative;
@property (nonatomic,copy)NSString *topics;
@property (nonatomic,copy)NSString *url;

+ (void)allNode:(ArrayBlock)list;

@end
