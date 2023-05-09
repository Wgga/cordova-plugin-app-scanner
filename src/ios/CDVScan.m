//
//  CDVScan.m
//  cordova-plugin-scan
//
//  Created by ZhangJian on 16/8/3.
//  Copyright © 2016年 zhangjian. All rights reserved.
//

#import "CDVScan.h"

#import <Cordova/CDVViewController.h>
#import "CDVScan.h"
#import "CDVScanViewController.h"
@interface CDVScan () {
    CDVInvokedUrlCommand *_command;
}
@end

@implementation CDVScan
-(void)pluginInitialize{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleScan:) name:@"scan" object:nil];
}

-(void)handleScan:(NSNotification*)ns{
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:ns.userInfo[@"content"]];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:_command.callbackId];
}


- (void)recognize:(CDVInvokedUrlCommand*)command{
    // 将传入的参数保存到成员变量中
    _command = command;
    // 创建一个导航控制器，并将扫描控制器作为根视图控制器
    UINavigationController *navController =[[UINavigationController alloc] initWithRootViewController:[[CDVScanViewController alloc] init]];
    // 设置导航栏的背景颜色为透明色
    [navController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [navController.navigationBar setShadowImage:[UIImage new]];
    // 设置导航栏标题的文本属性
    [navController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    // 设置导航栏按钮的颜色
    [navController.navigationBar setTintColor:[UIColor whiteColor]];
    // 设置导航栏是否半透明
    [navController.navigationBar setTranslucent:YES];
    // 设置导航控制器全屏显示
    navController.modalPresentationStyle = UIModalPresentationFullScreen;
    // 在当前窗口的根视图控制器上展示导航控制器
    [[[[[UIApplication sharedApplication] delegate] window] rootViewController] presentViewController:navController animated:YES completion:NULL];
}

- (void) dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end

