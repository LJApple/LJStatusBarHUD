//
//  LJStatusBarHUD.m
//  UIStatusBarHUB
//
//  Created by 吕俊 on 16/3/3.
//  Copyright © 2016年 吕俊. All rights reserved.
//

#import "LJStatusBarHUD.h"

@implementation LJStatusBarHUD

/** 全局的窗口*/
static UIWindow *window_;
/** 定时器*/
static NSTimer *timer_;

/**
*  显示窗口
*/
+ (void) showWindow
{
    // frame
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, - windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    window_ = [[UIWindow alloc] initWithFrame:frame];
    window_.windowLevel = UIWindowLevelAlert;
    window_.hidden = NO;
    window_.backgroundColor = [UIColor blackColor];
    
    // 动画
    frame.origin.y = 0;
    [UIView animateWithDuration:0.25 animations:^{
        window_.frame = frame;
    }];
}
/**
 *  显示普通信息
 *
 *  @param msg   文字
 *  @param image 图片
 */
+ (void)showMessage:(NSString *)msg img:(UIImage *)image
{
    // 显示窗口
    [self showWindow];
    
    // 添加按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setTitle:msg forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    }
    button.frame = window_.bounds;
    [window_ addSubview:button];
    
    // 定时器
    timer_ =  [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(hide) userInfo:nil repeats:NO];
}
/**
 *  显示普通信息
 *
 *  @param msg 信息
 */
+ (void)showMessage:(NSString *)msg
{
    [self showMessage:msg img:nil];
}
/**
 *  显示成功信息
 */
+ (void)showSuccess:(NSString *)msg
{
    [self showMessage:msg img:[UIImage imageNamed:@"UIStatusBarHUB.bundle/success"]];
}
/**
 *  显示失败信息
 */
+ (void)showError:(NSString *)msg
{
    [self showMessage:msg img:[UIImage imageNamed:@"UIStatusBarHUB.bundle/error"]];
}

/**
 *  显示正在处理的信息
 */
+ (void)showLoading: (NSString *)msg
{
    // 停止定时器
    [timer_ invalidate];
    timer_ = nil;
    [self showWindow];
    // 添加文字n
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:12];
    label.frame = window_.bounds;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = msg;
    label.textColor =  [UIColor whiteColor];
    [window_ addSubview:label];
    
    // 添加圈圈
    UIActivityIndicatorView *loadView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadView startAnimating];
    
    // 文字宽度
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}].width;
    CGFloat centerX = (window_.frame.size.width - msgW)*0.5 - 20;
    CGFloat centerY = window_.frame.size.height * 0.5;
    loadView.center = CGPointMake(centerX, centerY);
    [window_ addSubview:loadView];
    
}
/**
 *  隐藏导航栏
 */
+ (void)hide
{
    [UIView animateWithDuration:0.25 animations:^{
        CGRect frame = window_.frame;
        frame.origin.y = - frame.size.height;
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_ = nil;
        timer_ = nil;
    }];
    
}

@end
