//
//  myLabel.m
//  单行透明度的变化,下拉变大,上拉显示tab
//
//  Created by 徐士友 on 16/8/26.
//  Copyright © 2016年 AirspaceProject All rights reserved.
//

#import "myLabel.h"

@implementation myLabel

+(myLabel*)labelWithframe:(CGRect)frame backgroundColor:(UIColor *)backgroundColor title:(NSString *)title font:(NSInteger)font Alignment:(NSTextAlignment)Alignment textColor:(UIColor *)textColor{
    
    myLabel * label = [[myLabel alloc] initWithFrame:frame];
    
    label.backgroundColor = backgroundColor;
    
    label.text = title;
    
    label.textColor = textColor;
    
    label.textAlignment = Alignment;
    
    label.font = [UIFont systemFontOfSize:font];
    
    
    return label;
    
}
//
//+(myLabel*)labelButWithframe:(CGRect)frame  title:(NSString *)title  Actions:(myLabelAction)action{
//    
//    
//   UILabel * label = [[UILabel alloc] initWithFrame:frame];
//    label.backgroundColor =color;
//    layer.layer.shadowOffset = CGSizeMake(0, 1);
//    
//    layer.layer.shadowOpacity = 0.7;
//    layer.layer.cornerRadius = 3;
//    layer.layer.shadowColor = shadowcolor.CGColor;
//    
//    
//    
//    self.headimageview.userInteractionEnabled = YES; //响应点击
//    
//    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showLeftMenu)];
//    
//    [self.headimageview addGestureRecognizer:tapGesture];
//    
//    
//    
//    [self.view addSubview:self.headimageview];
//    
//
//    
//    
//}
@end
