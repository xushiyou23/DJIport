//
//  RootViewController.m
//  AirspaceProject
//
//  Created by 徐士友 on 2018/8/23.
//  Copyright © 2018年 AirspaceProject. All rights reserved.
#import "RootViewController.h"
#import "UIImage+Scale.h"
#import "UINavigationController+FDFullscreenPopGesture.h"
@interface RootViewController ()<UIGestureRecognizerDelegate>
@property (nonatomic, weak) UIImageView *lineView;
@end

@implementation RootViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    ///1011
    self.navigationController.navigationBar.hidden = YES;
    
    if([[[UIDevice currentDevice] systemVersion] floatValue]>=8.0 && [UINavigationBar conformsToProtocol:@protocol(UIAppearanceContainer)]) {
        [[UINavigationBar appearance] setTranslucent:NO];
    }
    
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = ColorWhite;
    
    //self.automaticallyAdjustsScrollViewInsets = NO;
    [self setStatusBarBackgroundColor:ColorClear];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    [UIApplication sharedApplication].statusBarHidden = NO;
    
  
//     self.fd_interactivePopDisabled=YES;//该页面禁止右滑返回
// 
//    // 创建手势
//    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(GoLeft)];
//    // 设置pan手势的代理
//    pan.delegate = self;
//    // 添加手势
//    [self.view addGestureRecognizer:pan];
 
 
    
}




//设置右侧的button
-(void)SetCustomBarWithLeftImage:(NSString *)leftImageName leftBtnString:(NSString *)leftBtnString  titleText:(NSString *)titleText rightImageName:(NSString* )rightImageName rightBtnSring:(NSString *)rightBtnSring target:(UIViewController *)target{
    
    //状态栏frame
    
    CGFloat navHeight = 100;
    CGFloat AddHeight = statusRect.size.height;
    self.navigationBar = [[UIView alloc]initWithFrame:CGRectMake(0,0, ScreenWidth, IPHONEHIGHT(navHeight)+AddHeight)];
    
    if (_iPhoneX) {
        self.navigationBar.height = 50+AddHeight;
        
    }
    self.navigationBar.backgroundColor = [UIColor whiteColor];
    [target.view addSubview:self.navigationBar];
    
    //左边按钮
   UIImageView * backImg = [[UIImageView alloc] initWithFrame:CGRectMake(IPHONEWIDTH(38),IPHONEHIGHT(navHeight-50)/2+AddHeight , IPHONEWIDTH(50), IPHONEWIDTH(50))];
    
    if (_iPhoneX) {
        backImg.top = 12.5+AddHeight;
    }
    
    backImg.image = [UIImage imageNamed:imgback];
    [self.navigationBar addSubview:backImg];
    
    self.leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0,0 , IPHONEWIDTH(120), self.navigationBar.height)];
    [self.navigationBar addSubview:self.leftBtn];
    [self.leftBtn addTarget: self action:@selector(GoLeft) forControlEvents:UIControlEventTouchUpInside];
    
    //导航栏标题
    self.titleLable = [[UILabel alloc]initWithFrame:CGRectMake(IPHONEWIDTH(150), IPHONEHIGHT(navHeight-48)/2+AddHeight, ScreenWidth-IPHONEWIDTH(300), IPHONEHIGHT(48))];
    
    if (_iPhoneX) {
        self.titleLable.top = 12.5+AddHeight;
        self.titleLable.height = 25;
    }
    
    if (titleText) {
        self.titleLable.text = titleText;
    }
    
    self.titleLable.textColor =Colorblack;
    self.titleLable.textAlignment = NSTextAlignmentCenter;
    self.titleLable.font = [UIFont systemFontOfSize:IPHONEWIDTH(34)];
    
    CGPoint titlePoint = self.titleLable.center;
    titlePoint.x = ScreenWidth/2;
    self.titleLable.center= titlePoint;
    
    [self.navigationBar addSubview:self.titleLable];
    
    
    //右按钮
    self.rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth-IPHONEWIDTH(28+70),AddHeight , IPHONEWIDTH(100), IPHONEHIGHT(100)) ];
    
    if (_iPhoneX) {
        self.rightBtn.height = 50;
    }
    
    // [self.rightBtn setBackgroundImage:[UIImage imageNamed:rightImageName] forState:UIControlStateNormal];
    self.rightBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    if (rightBtnSring) {
        [self.rightBtn setTitle:rightBtnSring forState:UIControlStateNormal];
        self.rightBtn.titleLabel.font = [UIFont systemFontOfSize:IPHONEWIDTH(30)];
        [self.rightBtn setTitleColor:[UIColor colorWithHexString:@"323232"] forState:UIControlStateNormal];
        
    }
    if (rightImageName) {
        
        [self.rightBtn setImage:[UIImage imageNamed:rightImageName] forState:UIControlStateNormal];
        self.rightBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    if (rightImageName&&rightBtnSring) {
        CGSize titleSize = [rightBtnSring sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:IPHONEWIDTH(30)]}];
        self.rightBtn.imageEdgeInsets = UIEdgeInsetsMake(0, titleSize.width, 0, -titleSize.width);
        self.rightBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -self.rightBtn.imageView.width-IPHONEWIDTH(5), 0, self.rightBtn.imageView.width+IPHONEWIDTH(5));
    }
    
    
    [self.navigationBar addSubview:self.rightBtn];
    
 
    
}

//返回上一级
-(void)GoLeft{
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
//    if(_GoBackFormer==1){
//
//        [UIViewPopAlert pushAlertTwoActionViewWithMessage:Text_info_update Target:self Title:alertText_TiShi  oneAlertTitle:@"取消" twoAlertTitle:@"退出" oneActionfunc:^{
//
//        } twoActionfunc:^{
//
//
//        }];
//
//
//    }
//    else if (_GoBackFormer==2){
//
//        [UIViewPopAlert pushAlertTwoActionViewWithMessage:Text_info_update Target:self Title:alertText_TiShi  oneAlertTitle:@"取消" twoAlertTitle:@"退出" oneActionfunc:^{
//
//        } twoActionfunc:^{
//
//
//        }];
//
//
//
//    }else if (_GoBackFormer ==3){
//
//        [UIViewPopAlert pushAlertTwoActionViewWithMessage:Text_info_update Target:self Title:alertText_TiShi  oneAlertTitle:@"取消" twoAlertTitle:@"退出" oneActionfunc:^{
//
//        } twoActionfunc:^{
//
//
//        }];
//    }
//    else{
//        /////没有值直接跳转
//       [self.navigationController popViewControllerAnimated:YES];
//    }
}



- (void)setStatusBarBackgroundColor:(UIColor *)color {
    
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }

}

-(void)setRightBtnStr:(NSString *)rightBtnStr{
    CGSize titleSize = [rightBtnStr sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:IPHONEWIDTH(30)]}];
    //NSLog(@"%f %f %f",titleSize.width,self.rightBtn.imageView.width,self.rightBtn.width);
    
    if ((titleSize.width+IPHONEWIDTH(20))>self.rightBtn.width) {
        
        self.rightBtn.imageEdgeInsets = UIEdgeInsetsMake(0,IPHONEWIDTH(125), 0, -IPHONEWIDTH(125));
        self.rightBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -self.rightBtn.imageView.width-IPHONEWIDTH(5), 0, self.rightBtn.imageView.width+IPHONEWIDTH(5));
    }else{
        
        self.rightBtn.imageEdgeInsets = UIEdgeInsetsMake(0, titleSize.width, 0, -titleSize.width);
        self.rightBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -self.rightBtn.imageView.width-IPHONEWIDTH(5), 0, self.rightBtn.imageView.width+IPHONEWIDTH(5));
    }
    
    
    [self.rightBtn setTitle:rightBtnStr forState:UIControlStateNormal];
}



@end
