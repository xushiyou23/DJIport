//
//  myLabel.h
//  单行透明度的变化,下拉变大,上拉显示tab
//
//  Created by 徐士友 on 16/8/26.
//  Copyright © 2016年 AirspaceProject All rights reserved.
//

#import <UIKit/UIKit.h>
@class myLabel;
@interface myLabel : UILabel

typedef void (^myLabelAction) (myLabel *Labelbut);
/**
 Label

 @param frame <#frame description#>
 @param backgroundColor <#backgroundColor description#>
 @param title <#title description#>
 @param font <#font description#>
 @param Alignment <#Alignment description#>
 @param textColor <#textColor description#>
 @return <#return value description#>
 */
+(myLabel*)labelWithframe:(CGRect)frame backgroundColor:(UIColor*)backgroundColor title:(NSString *)title font:(NSInteger)font Alignment:(NSTextAlignment)Alignment textColor:(UIColor*)textColor ;


/**
 统一按钮  圆角+阴影+点击事件+中间文字--Label
 action:  titleActions

 */
//+(myLabel*)labelButWithframe:(CGRect)frame  title:(NSString *)title  Actions:(myLabelAction)action;
@end
