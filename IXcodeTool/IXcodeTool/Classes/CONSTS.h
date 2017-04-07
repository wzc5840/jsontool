//
//  CONSTS.h
//
//
//  Created by Symond on 13-12-3.
//  Copyright (c) 2013年 Symond. All rights reserved.
//

#ifndef Zhangzidao_CONSTS_h
#define Zhangzidao_CONSTS_h


//rtsp://10.6.102.10:8554/desktop


#define IMAGE(img) [UIImage imageNamed:img]


#define SHOW_NEU_LOG 1

#define Screen_height   [[UIScreen mainScreen] bounds].size.height
#define Screen_width    [[UIScreen mainScreen] bounds].size.width

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define IS_IPHONE5 (DATA_GLOBAL.isIphone5?YES:NO)

#define SAFE_RELEASE(obj)     [obj release]; obj = nil;
#define POST_MESSAGE(msg)  [[NSNotificationCenter defaultCenter] postNotificationName:msg object:self userInfo:nil];
#define POST_MESSAGE_WITH_DIC(msg,dic)  [[NSNotificationCenter defaultCenter] postNotificationName:msg object:self userInfo:dic];
#define HIDE_PROGRESS_VIEW     NSDictionary *dic = [NSDictionary dictionaryWithObject:@"NO" forKey:@"beShow"];[[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_SHOW_PROGRESS_VIEW object:self userInfo:dic];
#define SHOW_PROGRESS_VIEW     NSDictionary *dic = [NSDictionary dictionaryWithObject:@"YES" forKey:@"beShow"];[[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_SHOW_PROGRESS_VIEW object:self userInfo:dic];

#define USER_DEFAULT [NSUserDefaults standardUserDefaults]

//is ipad
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

//color
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

#define TITLE_COLOR [UIColor redColor]

#define BACKBROUND_COLOR RGBCOLOR(228,227,232)

//debug
#define AfxMessagebox(title,msg) UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", @"确定") otherButtonTitles:nil, nil];[alert show];[alert release];

//Nslog
#ifdef SHOW_NEU_LOG
#define NeuLogDetail(s, ... ) NSLog(@"\r\nFile: ---------------------> %s\r\n---------------------> %s :Line->%d \r\nlogInfo=> %@",__FILE__,__func__, __LINE__,[NSString stringWithFormat:(s), ##__VA_ARGS__]);
#define NeuLog(s, ... ) NSLog(@"\r\n\r\n------------------------logInfo start------------------------\n%@",[NSString stringWithFormat:(s), ##__VA_ARGS__]);

#elif SHOW_NEU_LOG_NONE
#define NeuLogDetail(s, ... )
#define NeuLog(s, ... )
#endif

#define NOTIFICATION_SHOW_PROGRESS_VIEW @"showProgressView"


//http 请求响应数据打印控制
#define PRINTF_RESPONSE_BODY 1
//#define PRINTF_RESPONSE_HEADER 1
//#define PRINTF_RESPONSE_HEADER_POWER_BY 1
//#define PRINTF_RESPONSE_HEADER_CONTENT_TYPE 1

#endif

//当引入OAFrameWork后 需要倒入以下几个库
//libxml2.dylib
//libz.dylib
//libicucore.dylib
//QuartzCore.framework
//CFNetwork.framework
//MobileCoreServices.framework
//SystemConfiguration.framework
//ImageIO.framework
//MapKit.framework
//
//并在TARGEST配置中 搜索 Other Linker Flags
//点击加号增加一项并输入"-lxml2"

//在xcode中左边选中项目的root节点,在中间编辑区的搜索框中输入"header search paths",
//双击Header Search Paths项,点击加号增加一项并输入"${SDK_DIR}/usr/include/libxml2"
