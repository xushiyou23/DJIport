//
//  UIView+PopAlert.m
//  AirspaceProject
//
//  Created by 徐士友 on 2018/8/11.
//  Copyright © 2018年 AirspaceProject. All rights reserved.
//


/*

 [alertController setValue:attrStr forKey:@"attributedTitle"];//修改title的，就是第一行标题
 
 
 [alertController setValue:attrStr forKey:@"attributedMessage"];//修改message，就是下一行小字的
*/

#import "UIViewPopAlert.h"
#define titleLins IPHONEWIDTH(20)
#define titleFont IPHONEWIDTH(34)

#define messageLins IPHONEWIDTH(5)
#define messageFont IPHONEWIDTH(28)

#define alertV1VC0 0
@implementation UIViewPopAlert




+(NSMutableAttributedString*)GetAttributeStringswithString:(NSString*)string  HaveFont:(CGFloat)font Lins:(CGFloat)lins  Alifnment:(NSTextAlignment)alignment{
    
    ////title--------------------------------------------------------------------
    NSMutableAttributedString * attributedStringtitle = [[NSMutableAttributedString alloc] initWithString:string];
    //设置行高 字体大小
    NSMutableParagraphStyle *paragraphStyletitle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyletitle setLineSpacing:lins];
    paragraphStyletitle.alignment = alignment;
    ///字体大小
    [attributedStringtitle addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:font] range:NSMakeRange(0, string.length)];
    ///行间距
    [attributedStringtitle addAttribute:NSParagraphStyleAttributeName value:paragraphStyletitle range:NSMakeRange(0, [string length])];
    
    
    return attributedStringtitle;
    
    
}

+(void)pushAlertTwoActionViewWithMessage:(NSString *)message Target:(UIViewController *)target Title:(NSString *)title oneAlertTitle:(NSString *)oneAlertTitle twoAlertTitle:(NSString *)twoAlertTitle ChangeSystem:(BOOL)boools oneActionfunc:(actionFunc )oneActionfunc twoActionfunc:(actionFunc)twoActionfunc{
 
    
    
    if (alertV1VC0) {
//        HHShowView *showView = [HHShowView alertTitle:title message:message messageAlignment:NSTextAlignmentCenter];
//
//        [showView addAction:[HHAlertAction actionTitle:oneAlertTitle style:HHAlertActionCancel handler:^(HHAlertAction *action) {
//            NSLog(@"取消取消取消取消");
//            [showView hide:target];
//             oneActionfunc();
//        }]];
//
//        [showView addAction:[HHAlertAction actionTitle:twoAlertTitle style:HHAlertActionConfirm handler:^(HHAlertAction *action) {
//            NSLog(@"确定确定确定确定");
//            [showView hide:target];
//             twoActionfunc();
//        }]];
//
//        [showView show:target];
//
     

    }else{
    
    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *oneaction = [UIAlertAction actionWithTitle:oneAlertTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        oneActionfunc();
        
    }];

    [alertView addAction:oneaction];
    
    UIAlertAction *twoaction = [UIAlertAction actionWithTitle:twoAlertTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        twoActionfunc();
        
    }];

    [alertView addAction:twoaction];

    
    if(boools){
        
    [alertView setValue:[UIViewPopAlert GetAttributeStringswithString:title HaveFont:titleFont Lins:titleLins Alifnment:NSTextAlignmentCenter] forKey:@"attributedTitle"];//修改title
        
    ///message-----------------------------------------------------------------
    [alertView setValue:[UIViewPopAlert GetAttributeStringswithString:message HaveFont:messageFont Lins:messageLins Alifnment:NSTextAlignmentLeft] forKey:@"attributedMessage"];//修改message，就是下一行小字的
    
    }
    
    [target presentViewController:alertView animated:YES completion:nil];
    
        
    }
    
}

+(void)pushAlertOneActionViewWithMessage:(NSString *)message Target:(UIViewController *)target Title:(NSString *)title oneAlertTitle:(NSString *)oneAlertTitle  ChangeSystem:(BOOL)boools TextAlignment:(NSTextAlignment)TextAlignment  oneActionfunc:(actionFunc)oneActionfunc{
    
    
    
    if (alertV1VC0) {
        
//        HHShowView *showView = [HHShowView alertTitle:title message:message messageAlignment:NSTextAlignmentCenter];
//
//        [showView addAction:[HHAlertAction actionTitle:oneAlertTitle style:HHAlertActionConfirm handler:^(HHAlertAction *action) {
//            NSLog(@"确定确定确定确定");
//            [showView hide:target];
//             oneActionfunc();
//        }]];
//        [showView show:target];
        
    }else{
    
    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *oneaction = [UIAlertAction actionWithTitle:oneAlertTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        oneActionfunc();
        
    }];

    [alertView addAction:oneaction];
    
    if(boools){
    
    [alertView setValue:[UIViewPopAlert GetAttributeStringswithString:title HaveFont:titleFont Lins:titleLins Alifnment:NSTextAlignmentCenter] forKey:@"attributedTitle"];//修改title
        
    ///message-----------------------------------------------------------------
    [alertView setValue:[UIViewPopAlert GetAttributeStringswithString:message HaveFont:messageFont Lins:messageLins Alifnment:TextAlignment] forKey:@"attributedMessage"];//修改message，就是下一行小字的
    
    }
    
        //[UIApplication sharedApplication].keyWindow.rootViewController
    [target presentViewController:alertView animated:YES completion:nil];
    
        
    }
}
@end
