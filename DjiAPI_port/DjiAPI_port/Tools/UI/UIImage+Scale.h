//
//  UIImage+Scale.h
//  AirspaceProject
//
//  Created by 徐士友 on 2018/8/11.
//  Copyright © 2018年 AirspaceProject. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Scale)
+(UIImage *)OriginImage:(UIImage *)image scaleToSize:(CGSize)size;
+ (UIImage *)imageWithColor:(UIColor *)color ;
+(UIImage*)createGrayCopy:(UIImage*)source;
//改变图片颜色
- (UIImage *)imageWithColor:(UIColor *)color;
@end
