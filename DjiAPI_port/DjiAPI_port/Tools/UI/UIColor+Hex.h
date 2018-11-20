//
//  UIColor+Hex.h
//  AirspaceProject
//
//  Created by 徐士友 on 2018/8/11.
//  Copyright © 2018年 AirspaceProject. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RGBA_COLOR(R, G, B, A) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:A]
#define RGB_COLOR(R, G, B) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:1.0f]


@interface UIColor (Hex)


+ (UIColor *)colorWithHexString:(NSString *)color;

//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
//RGB
+(UIColor*)colorsWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;

/**
带有固定的透明度 0.7

 @param red <#red description#>
 @param green <#green description#>
 @param blue <#blue description#>
 @return <#return value description#>
 */
+(UIColor*)colorsAlphaWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;
@end
