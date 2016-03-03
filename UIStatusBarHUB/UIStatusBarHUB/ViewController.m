//
//  ViewController.m
//  UIStatusBarHUB
//
//  Created by 吕俊 on 16/3/3.
//  Copyright © 2016年 吕俊. All rights reserved.
//

#import "ViewController.h"
#import "LJStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)showSuccess:(id)sender {
    [LJStatusBarHUD showSuccess:@"加载成功"];
}
- (IBAction)hide:(id)sender {
    [LJStatusBarHUD hide];
}
- (IBAction)error:(id)sender {
    [LJStatusBarHUD showError:@"加载失败"];
}
- (IBAction)load:(id)sender {
    [LJStatusBarHUD showLoading:@"正在加载"];
}
- (IBAction)message:(id)sender {
    [LJStatusBarHUD showMessage:@"平常信息"];
}

@end
