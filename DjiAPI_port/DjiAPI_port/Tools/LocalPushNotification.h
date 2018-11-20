//
//  LocalPushNotification.h
//  AirspaceProject
//
//  Created by 徐士友 on 2018/8/23.
//  Copyright © 2018年 AirspaceProject. All rights reserved.

#import <Foundation/Foundation.h>

@interface LocalPushNotification : NSObject
@property(nonatomic,assign) NSInteger applicationIconBadgeNumber;
//单利使用 本地推送
/*
 1.在需要的地方直接 获得单利 调用 LocalNotificationWithalertBody:(NSString*)alertBody
 //发送给推送
 [[LocalPushNotification shareLocalPushNotification]LocalNotificationWithalertBody:@"发起了一个推送",title]];
 

 2.需要特殊处理的 调用LocalNotificationWithalertBodyaMessages:(NSArray*)aMessages WithMark:(NSString*)mark
 
 
 ⚠️：需要在appdeligate中applicationDidBecomeActive:(UIApplication *)application 方法中调用单利 中的 applicationIconBadgeNumber 设置为0
 //本地推送清0
 [LocalPushNotification shareLocalPushNotification].applicationIconBadgeNumber =0;
 
 
 */

+(LocalPushNotification *)shareLocalPushNotification;



/**
 直接发推送  

 @param alertBody 推送文字
 */
-(void)LocalNotificationWithalertBody:(NSString*)alertBody status:(NSInteger)status;


/**
 清空美洽消息计数

 @param uid uid
 */
-(void)MeiQiaClearMessageNumber:(NSString*)userId;
@end
