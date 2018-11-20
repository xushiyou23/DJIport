//
//  HomeViewController.m
//  DjiAPI_port
//
//  Created by xujiahui on 2018/11/19.
//  Copyright © 2018年 xujiahui. All rights reserved.
//

#import "HomeViewController.h"
#import <DJISDK/DJISDK.h>
@interface HomeViewController ()<DJISDKManagerDelegate>
@property (nonatomic) DJIAppActivationState activationState;
@property (nonatomic) DJIAppActivationAircraftBindingState aircraftBindingState;
@property (weak, nonatomic) IBOutlet UILabel *bindingStateLabel;

@property (weak, nonatomic) IBOutlet UILabel *appActivationLabel;
@property (weak, nonatomic) IBOutlet UIImageView *logoImageview;


@end

@implementation HomeViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}

-(void)registerApp{
    
    [DJISDKManager registerAppWithDelegate:self];
}

-(void)appRegisteredWithError:(NSError *)error{
    
    NSString * string = @"注册成功了";
    
    if (error) {
        string = @"Register App Failed! Please enter your App Key in the plist file and check the network.";
    }else
    {
        NSLog(@"registerAppSuccess");
        
        [DJISDKManager startConnectionToProduct];
        [DJISDKManager appActivationManager].delegate = self;
        self.activationState = [DJISDKManager appActivationManager].appActivationState;
        self.aircraftBindingState = [DJISDKManager appActivationManager].aircraftBindingState;
    }
    
    [UIViewPopAlert pushAlertOneActionViewWithMessage:string Target:self Title:alertText_TiShi oneAlertTitle:alertText_QueDing ChangeSystem:NO TextAlignment:NSTextAlignmentCenter oneActionfunc:^{
        
    }];
    
}

-(void)updateUI {
    
    self.logoImageview.layer.cornerRadius = self.logoImageview.width/2;
    self.logoImageview.layer.masksToBounds = YES;
    switch (self.aircraftBindingState) {
        case DJIAppActivationAircraftBindingStateUnboundButCannotSync:
            self.bindingStateLabel.text = @"没有绑定，请连接Internet以更新状态。";
            break;
        case DJIAppActivationAircraftBindingStateUnbound:
            self.bindingStateLabel.text = @"没有绑定。 使用DJI GO绑定飞机。";
            break;
        case DJIAppActivationAircraftBindingStateUnknown:
            self.bindingStateLabel.text = @"未知";
            break;
        case DJIAppActivationAircraftBindingStateBound:
            self.bindingStateLabel.text = @"绑定";
            break;
        case DJIAppActivationAircraftBindingStateInitial:
            self.bindingStateLabel.text = @"初始化";
            break;
        case DJIAppActivationAircraftBindingStateNotRequired:
            self.bindingStateLabel.text = @"Binding is not required. ";
            break;
        case DJIAppActivationAircraftBindingStateNotSupported:
            self.bindingStateLabel.text = @"APP不支持激活";
            break;
    }
    
    switch (self.activationState) {
        case DJIAppActivationStateLoginRequired:
            self.appActivationLabel.text = @"需要登录才能激活。";
            break;
        case DJIAppActivationStateUnknown:
            self.appActivationLabel.text = @"未知";
            break;
        case DJIAppActivationStateActivated:
            self.appActivationLabel.text = @"活动状态";
            break;
        case DJIAppActivationStateNotSupported:
            self.appActivationLabel.text = @"APP不支持激活";
            break;
    }
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self registerApp];
    [self updateUI];
}

- (IBAction)onLoginClick:(id)sender {
    [[DJISDKManager userAccountManager] logIntoDJIUserAccountWithAuthorizationRequired:NO withCompletion:^(DJIUserAccountState state, NSError * _Nullable error) {
        if (error) {
            [MBProgressHUD showText:[NSString stringWithFormat:@"登录错误: %@", error.description] HUDAddedTo:self.view animated:YES afterDelay:showtime];
            
        }else{
            [MBProgressHUD showText:@"Dji账户登录成功" HUDAddedTo:self.view animated:YES afterDelay:showtime];
            
        }
    }];
}
- (IBAction)onLogoutClick:(id)sender {
    [[DJISDKManager userAccountManager] logOutOfDJIUserAccountWithCompletion:^(NSError * _Nullable error) {
        if (error) {
            
            if (error.code == -6001) {
                [MBProgressHUD showText:@"Dji账户暂未登录" HUDAddedTo:self.view animated:YES afterDelay:showtime];
            }else{
            
            [MBProgressHUD showText:[NSString stringWithFormat:@"退出错误: %@", error.description] HUDAddedTo:self.view animated:YES afterDelay:showtime];
            }
        }else{
            [MBProgressHUD showText:@"Dji账户退出成功"HUDAddedTo:self.view animated:YES afterDelay:showtime];
            
        }
    }];
}

#pragma mark DJIAppActivationManagerDelegate Methods
-(void)manager:(DJIAppActivationManager *)manager didUpdateAppActivationState:(DJIAppActivationState)appActivationState {
    self.activationState = appActivationState;
    [self updateUI];
}
-(void)manager:(DJIAppActivationManager *)manager didUpdateAircraftBindingState:(DJIAppActivationAircraftBindingState)aircraftBindingState {
    self.aircraftBindingState = aircraftBindingState;
    [self updateUI];
}
@end
