//
//  MBProgressHUD+Extension.m
//  UDrivingCustomer
//
//  Created by dihong on 16/7/12.
//  Copyright © 2016年 Marike Jave. All rights reserved.
//

#import "MBProgressHUD+Extension.h"
#define navHeight 120
#define fontNum 30
@implementation MBProgressHUD (Extension)

+ (MBProgressHUD *)showProgressText:(NSString *)text HUDAddedTo:(UIView *)view animated:(BOOL)animated;{
    [MBProgressHUD hideAllHUDsForView:view animated:NO];
    
    MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    //状态栏frame
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    
    progressHUD.frame = CGRectMake(0, rectStatus.size.height+IPHONEHIGHT(navHeight),ScreenWidth , ScreenHeight-rectStatus.size.height-IPHONEHIGHT(navHeight));
    progressHUD.removeFromSuperViewOnHide = YES;
    progressHUD.label.text = text;
  
    progressHUD.label.font = [UIFont systemFontOfSize:IPHONEWIDTH(35)];
    CGSize labelSize = [text sizeWithFont:[UIFont systemFontOfSize:IPHONEWIDTH(fontNum)] constrainedToSize:CGSizeMake(ScreenWidth-IPHONEWIDTH(56), MAXFLOAT)];
    progressHUD.label.size = CGSizeMake(labelSize.width, labelSize.height);
    progressHUD.label.textAlignment = NSTextAlignmentLeft;
    progressHUD.label.numberOfLines = 0;
    
    return progressHUD;
}

+ (MBProgressHUD *)showText:(NSString *)text HUDAddedTo:(UIView *)view animated:(BOOL)animated afterDelay:(NSTimeInterval)delay{
    
    [MBProgressHUD hideAllHUDsForView:view animated:NO];
    
    MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    //状态栏frame
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    
    progressHUD.frame = CGRectMake(0, rectStatus.size.height+IPHONEHIGHT(navHeight),ScreenWidth , ScreenHeight-rectStatus.size.height-IPHONEHIGHT(navHeight));
    [progressHUD toText:text hide:animated afterDelay:delay];
    
    return progressHUD;
}

- (void)toText:(NSString *)text hide:(BOOL)animated afterDelay:(NSTimeInterval)delay;{
    self.removeFromSuperViewOnHide = YES;
    self.mode = MBProgressHUDModeText;
    if (text.length>200) {
        text = [text substringWithRange:NSMakeRange(0, 200)];
    }
    self.label.text = text;
    
    [self hideAnimated:animated afterDelay:delay];
    
    self.bezelView.color = [UIColor blackColor];
    self.contentColor = [UIColor whiteColor];
    self.label.font = [UIFont systemFontOfSize:IPHONEWIDTH(35)];
    CGSize labelSize = [text sizeWithFont:[UIFont systemFontOfSize:IPHONEWIDTH(fontNum)] constrainedToSize:CGSizeMake(ScreenWidth-IPHONEWIDTH(56), MAXFLOAT)];
    if (labelSize.height>100) {
        labelSize.height = 100;
    }
    
    self.label.size = CGSizeMake(labelSize.width, labelSize.height);
    self.label.textAlignment = NSTextAlignmentLeft;
    self.label.numberOfLines = 0;
}

+(void)ShowProgressView:(UIView *)view animated:(BOOL)animated{
    
    [MBProgressHUD hideAllHUDsForView:view animated:NO];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:animated];
    //状态栏frame
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    
//    hud.bezelView.color = [UIColor blackColor];
//    hud.contentColor = ColorCellLine;//[UIColor whiteColor];
    
    hud.frame = CGRectMake(0, rectStatus.size.height+IPHONEHIGHT(navHeight),ScreenWidth , ScreenHeight-rectStatus.size.height-IPHONEHIGHT(navHeight));
    
}

@end
