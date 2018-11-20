
//
//  ColorImageSize.h
//  AirspaceProject
//
//  Created by xujiahui on 2018/11/5.
//  Copyright © 2018年 AirspaceProject. All rights reserved.
//

#ifndef ColorImageSize_h
#define ColorImageSize_h

#pragma mark///////////------------------ 图片
#define imgback @"backimg"


#pragma mark// -------------------------   颜色 color
#define ColorWhite [UIColor whiteColor]
#define ColorClear [UIColor clearColor]
#define Colorblack [UIColor blackColor]

#pragma mark///----------------------------------------- 固定尺寸 大小
//字体大小
#define UiFontIPH(num) [UIFont systemFontOfSize:IPHONEWIDTH(num)]
//固定左右边距36
#define Fixed36 IPHONEWIDTH(36)
///主页的左右 菜单的宽度
#define LeftMenuWidth 400
#define RightMenuWidth 483

#pragma mark///----------------------------------------- 适配尺寸 大小

#define statusRect [[UIApplication sharedApplication] statusBarFrame]
#define ScreenWidth CGRectGetWidth([UIScreen mainScreen].bounds)
#define ScreenHeight CGRectGetHeight([UIScreen mainScreen].bounds)
#define ScreenSize  self.view.frame.size

#define IPHONEHIGHT(b) [UIScreen mainScreen].bounds.size.height*((b)/1294.0)
#define IPHONEWIDTH(a) [UIScreen mainScreen].bounds.size.width*((a)/750.0)

//返回整数 应对 label有小数时会有边框
#define IPHONEHIGHTInt(b) (int)([UIScreen mainScreen].bounds.size.height*((b)/1294.0))
#define IPHONEWIDTHInt(a) (int)([UIScreen mainScreen].bounds.size.width*((a)/750.0))
//有分栏的情况下高度
#define PhoneHight(d) ([UIScreen mainScreen].bounds.size.height - _TabbarHeight)*((d)/1108.0)

// Status bar & navigation bar height.
#define  _StatusBarAndNavigationBarHeight  (_iPhoneX ? 88.f : 64.f)
// Tabbar height.
#define  _TabbarHeight         (_iPhoneX ? (49.f+34.f) : 49.f)
// iPhone X
#define  _iPhoneX (ScreenWidth == 375.f && ScreenHeight == 812.f ? YES : NO)


#endif /* ColorImageSize_h */
