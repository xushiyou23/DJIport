//
//  RootViewController.h
//  AirspaceProject
//
//  Created by 徐士友 on 2018/8/23.
//  Copyright © 2018年 AirspaceProject. All rights reserved.

#import <UIKit/UIKit.h>
@interface RootViewController : UIViewController
@property(nonatomic,strong)UIView *navigationBar;
@property(nonatomic,strong)UIButton *leftBtn;
@property(nonatomic,strong)UILabel *titleLable;
@property(nonatomic,strong)UIButton *rightBtn;
@property(nonatomic,copy)NSString *rightBtnStr;

@property(nonatomic,assign) NSInteger GoBackFormer; // 1 转前需要东西。 0 直接可以跳转了  


-(void)SetCustomBarWithLeftImage:(NSString *)leftImageName leftBtnString:(NSString *)leftBtnString  titleText:(NSString *)titleText rightImageName:(NSString* )rightImageName rightBtnSring:(NSString *)rightBtnSring target:(UIViewController *)target;

/**
 返回上一页
 */
-(void)GoLeft;

//设置状态栏颜色
- (void)setStatusBarBackgroundColor:(UIColor *)color ;
//带右侧button宽的
-(void)SetCustomBarWithLeftImage:(NSString *)leftImageName leftBtnString:(NSString *)leftBtnString  titleText:(NSString *)titleText rightImageName:(NSString* )rightImageName rightBtnSring:(NSString *)rightBtnSring target:(UIViewController *)target Width:(CGFloat)width;
@end
