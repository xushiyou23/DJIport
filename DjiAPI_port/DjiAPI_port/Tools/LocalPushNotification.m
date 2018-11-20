//
//  LocalPushNotification.m
//  AirspaceProject
//
//  Created by 徐士友 on 2018/8/23.
//  Copyright © 2018年 AirspaceProject. All rights reserved.
#import "LocalPushNotification.h"

#import <AudioToolbox/AudioToolbox.h>//设置声音
#import <UserNotifications/UserNotifications.h>
#import <AVFoundation/AVFoundation.h>

#import "AppDelegate.h"

@interface LocalPushNotification ()


@end

@implementation LocalPushNotification

static LocalPushNotification * localPush;

+(LocalPushNotification*)shareLocalPushNotification{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        localPush =[[self alloc]init];
    });
    
    
    return localPush;
}






-(void)LocalNotificationWithalertBody:(NSString*)alertBody status:(NSInteger)status{
    
   
    
    //推送设置
    UILocalNotification* content = [[UILocalNotification alloc]init];
    content.timeZone = [NSTimeZone defaultTimeZone];
    content.alertBody = alertBody;
    
    if(status==1){
        content.userInfo = @{@"status":@"1"};
    }else if(status==33){
        //聊天消息
        
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        appDelegate.messageNum +=1;

        content.alertTitle = @"聊天消息";
        content.alertBody = @"您有1条未读消息";//[NSString stringWithFormat:@"您有%ld条未读消息",messagenum];
        
        content.userInfo =@{@"aps":@{@"custom":@"{\"messageType\":\"CHAT_MESSAGE\"}"}};
  //@{@"status":@"33"};
    }
    
    content.soundName= UILocalNotificationDefaultSoundName;
    
    UIApplicationState state = [UIApplication sharedApplication].applicationState;
    if(state == UIApplicationStateBackground){
        
        _applicationIconBadgeNumber=_applicationIconBadgeNumber+1;
        
        content.applicationIconBadgeNumber = _applicationIconBadgeNumber;
        
        NSLog(@"后台");
        
    }else if (state == UIApplicationStateActive){
        
        NSLog(@"前台");
        
    }
   
    
    [[UIApplication sharedApplication] scheduleLocalNotification:content];

    
    
}

@end
