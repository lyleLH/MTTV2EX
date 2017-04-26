//
//  MTTNavigationViewController.m
//  MTTV2EX
//
//  Created by lyleKP on 2017/3/30.
//  Copyright © 2017年 lyle. All rights reserved.
//

#import "MTTNavigationViewController.h"

@interface MTTNavigationViewController ()

@end

@implementation MTTNavigationViewController


+ (void)initialize {
    UINavigationBar * naviBar = [UINavigationBar appearance] ;
    [naviBar setBarTintColor: [UIColor whiteColor]];
    [naviBar setTintColor:[UIColor whiteColor]];
    
    [naviBar setTitleTextAttributes:@{NSForegroundColorAttributeName: UIColorFromRGB(0x333333),NSFontAttributeName:[UIFont systemFontOfSize:18]}];
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
