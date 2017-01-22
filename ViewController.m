//
//  ViewController.m
//  iOS-评分
//
//  Created by 云媒 on 17/1/22.
//  Copyright © 2017年 YunMei. All rights reserved.
//

#import "ViewController.h"

#import <StoreKit/StoreKit.h>
@interface ViewController ()<SKStoreProductViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
//在应用内,内置AppStore进行评分
- (void)loadAppStoreController
{
    // 初始化控制器
    SKStoreProductViewController *storeProductViewContorller = [[SKStoreProductViewController alloc]init];
    // 设置代理请求为当前控制器本身
    storeProductViewContorller.delegate=self;
    
    [storeProductViewContorller loadProductWithParameters:@{SKStoreProductParameterITunesItemIdentifier:@"1189430633"}completionBlock:^(BOOL result,NSError*error)   {
        
        if(error)  {
            
            NSLog(@"error %@ with userInfo %@",error,[error userInfo]);
        }else{
            
            //模态弹出appstore
            [self presentViewController:storeProductViewContorller animated:YES completion:nil];
        }
        
    }];
}
    
    //AppStore取消按钮监听
    
- (void)productViewControllerDidFinish:(SKStoreProductViewController*)viewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
    


- (IBAction)button:(id)sender {
    //跳出应用,跳转到AppStore,进行评分
    //[[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=1189430633&pageNumber=0&sortOrdering=2&type=Purple+Software&mt=8"]];
    
    [self loadAppStoreController];
}




@end
