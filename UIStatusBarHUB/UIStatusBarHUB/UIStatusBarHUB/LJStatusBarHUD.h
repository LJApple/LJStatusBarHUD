//
//  LJStatusBarHUD.h
//  UIStatusBarHUB
//
//  Created by 吕俊 on 16/3/3.
//  Copyright © 2016年 吕俊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJStatusBarHUD : NSObject

/**
 *  显示普通信息
 *
 *  @param msg   文字
 *  @param image 图片
 */
+ (void)showMessage:(NSString *)msg img:(UIImage *)image;
/**
 *  显示普通信息
 *
 *  @param msg 信息
 */
+ (void)showMessage:(NSString *)msg;
/**
 *  显示成功信息
 */
+ (void)showSuccess:(NSString *)msg;
/**
 *  显示失败信息
 */
+ (void)showError:(NSString *)msg;
/**
 *  隐藏导航栏
 */
+ (void)hide;

/**
 *  显示正在处理的信息
 */
+ (void)showLoading: (NSString *)img;

@end
