//
//  WZC_AppDelegate.h
//  IXcodeTool
//
//  Created by Symond on 14-4-24.
//  Copyright (c) 2014年 WZC. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface WZC_AppDelegate : NSObject <NSApplicationDelegate,NSPathControlDelegate>
{
    NSStatusItem *trayItem;

}

@property (assign) IBOutlet NSWindow *window;


/**
 *  输入的JSON数据TextView
 */
@property (retain,nonatomic) IBOutlet NSTextView *jsonDataTextView;
/**
 *  清空按钮对像
 */
@property (retain,nonatomic) IBOutlet NSButton *btnClear;

/**
 *  选中的路径
 */
@property (retain,nonatomic) IBOutlet NSTextField *textFieldPath;

/**
 *  要生成的文件的类名
 */
@property (retain,nonatomic) IBOutlet NSTextField *textFieldClassName;

/**
 *  要生成的文件的类的父类的类名
 */
@property (retain,nonatomic) IBOutlet NSTextField *textFieldParentClassName;

@property (retain,nonatomic) IBOutlet NSTabView *tabView;

@property (retain,nonatomic) IBOutlet NSPathControl *pathControl;
/**
 *  输入16进制RGB颜色的TextView
 */
@property (retain,nonatomic) IBOutlet NSTextField *textFieldhexRgb;
/**
 *  显示R的值
 */
@property (retain,nonatomic) IBOutlet NSTextField *textFieldR;
/**
 *  显示G的值
 */
@property (retain,nonatomic) IBOutlet NSTextField *textFieldG;
/**
 *  显示B的值
 */
@property (retain,nonatomic) IBOutlet NSTextField *textFieldB;


/**
 *  清空按钮点击事件
 *
 *  @param sender 清空按钮对像
 */
- (IBAction)btnClearClicked:(id)sender;

/**
 *  make按钮点击事件
 *
 *  @param sender make按钮对像
 */
- (IBAction)btnMakeClicked:(id)sender;
/**
 *  转换16进制RGB到RGB
 *
 *  @param sender 转换按钮对像
 */
- (IBAction)btnConvertClicked:(id)sender;


@end
