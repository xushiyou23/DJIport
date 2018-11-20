//
//  UIView+PopAlert.h
//  AirspaceProject
//
//  Created by 徐士友 on 2018/8/11.
//  Copyright © 2018年 AirspaceProject. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^actionFunc)(void);

@interface UIViewPopAlert :NSObject



///返回 富文本  string  font  lins间距
+(NSMutableAttributedString*)GetAttributeStringswithString:(NSString*)string  HaveFont:(CGFloat)font Lins:(CGFloat)lins Alifnment:(NSTextAlignment)alignment;

/**
 一个 button
 textMessage对齐状态
 
 @param message <#message description#>
 @param target <#target description#>
 @param title <#title description#>
 @param alertTitle <#alertTitle description#>
 @param boools <#boools description#>
 @param TextAlignment <#TextAlignment description#>
 */
+(void)pushAlertOneActionViewWithMessage:(NSString *)message Target:(UIViewController *)target Title:(NSString *)title oneAlertTitle:(NSString *)oneAlertTitle  ChangeSystem:(BOOL)boools TextAlignment:(NSTextAlignment)TextAlignment  oneActionfunc:(actionFunc)oneActionfunc;

/**
 两个 button
 yes:又间距 设置字体大小
 NO： 系统默认
 @param message <#message description#>
 @param target <#target description#>
 @param title <#title description#>
 @param oneAlertTitle <#oneAlertTitle description#>
 @param twoAlertTitle <#twoAlertTitle description#>
 @param oneActionfunc <#oneActionfunc description#>
 @param twoActionfunc <#twoActionfunc description#>
 */
+(void)pushAlertTwoActionViewWithMessage:(NSString *)message Target:(UIViewController *)target Title:(NSString *)title oneAlertTitle:(NSString *)oneAlertTitle twoAlertTitle:(NSString *)twoAlertTitle ChangeSystem:(BOOL)boools oneActionfunc:(actionFunc )oneActionfunc twoActionfunc:(actionFunc)twoActionfunc ;

@end
