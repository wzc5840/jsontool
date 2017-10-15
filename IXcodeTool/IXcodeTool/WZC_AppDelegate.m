//
//  WZC_AppDelegate.m
//  IXcodeTool
//
//  Created by Symond on 14-4-24.
//  Copyright (c) 2014年 WZC. All rights reserved.
//

#import "WZC_AppDelegate.h"
#import "WZC_DataModalParser.h"
//#import "TestCommonData.h"

@implementation WZC_AppDelegate

@synthesize btnClear = _btnClear;
@synthesize jsonDataTextView = _jsonDataTextView;
@synthesize textFieldPath = _textFieldPath;
@synthesize pathControl = _pathControl;
@synthesize textFieldClassName = _textFieldClassName;
@synthesize textFieldParentClassName = _textFieldParentClassName;


- (IBAction)testAction:(id)sender;
{
    NSLog(@"Hello World");
}

- (IBAction)quitAction:(id)sender;
{
    [NSApp terminate:sender];
}


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    //[_jsonDataTextView setString: @"{\"id\":1.2,\"hello\":1,\"ff\":1.2,\"cc\":false}"];
    //[_jsonDataTextView setString: @"{\"aa\":true,\"bb\":1,\"cc\":1.2,\"dd\":\"hello\",\"ee\":null,\"ff\":[{\"dd\":\"hello1\"},{\"dd\":\"hello1\"}],\"gg\":{\"dd\":\"hello11\"},\"hh\":[\"1\",\"2\"]}"];
    
    //[_jsonDataTextView setString: @"{\"ff\":[{\"dd\":\"hello1\"},{\"dd\":\"hello1\"}],\"gg\":[1.2,4.3],\"hh\":[\"1\",\"2\"]}"];
    //[_jsonDataTextView setString: @"{\"gg\":[1.2,4.3]}"];
    
//    [_jsonDataTextView setString:@"{\"be\":true,\"id\": \"123123\",\"total_price\": \"103.45\",\"products\" : [{\"id\": \"123\",\"name\": \"Product #1\",\"price\": 12.95,\"testDic\":{\"a\":\"hhhhh\"}},{\"id\": \"137\",\"name\": \"Product #2\",\"price\": 82.95,\"testDic\":{\"a\":\"hhhhh\"}}],\"dataDic\":{\"abc\":\"hahaha\",\"num\":\"100\",\"testDic\":{\"a\":\"hhhhh\"}}}"];
    
    [_jsonDataTextView setString:@""];

    [_textFieldPath setStringValue:@""];
    
    [_textFieldR setStringValue:@""];
    [_textFieldG setStringValue:@""];
    [_textFieldB setStringValue:@""];
    
    
    NSZone *zone = [NSMenu menuZone];
    NSMenu *menu = [[NSMenu allocWithZone:zone] init];
    NSMenuItem *item;
    item = [menu addItemWithTitle:@"Testing" action:@selector(testAction:) keyEquivalent:@""];
    [item setTarget:self];
    item = [menu addItemWithTitle:@"Quit" action:@selector(quitAction:) keyEquivalent:@""];
    [item setTarget:self];
    trayItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSSquareStatusItemLength];
    [trayItem setMenu:menu];
    [trayItem setHighlightMode:YES];
    [trayItem setTitle:@"IX"];
    
    [_tabView selectTabViewItemAtIndex:0];
    
}

- (IBAction)btnClearClicked:(id)sender
{
    NSLog(@"btnClearClicked");
    [_jsonDataTextView setString:@""];
    
    
//    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithDouble:1.2],@"id",
//                         [NSNumber numberWithDouble:1],@"hello",[NSNumber numberWithDouble:1.2],@"ff",@"2",@"cc",nil];
//    TestCommonData *da = [[TestCommonData alloc] initWithDataDic:dic];
//    NSLog(@"da = %@",da);
    return;
}

- (IBAction)btnMakeBaseClicked:(id)sender{
    NSLog(@"btnMakeBaseClicked path = %@",[_pathControl.URL path]);
    BOOL beOk = [[WZC_DataModalParser getInstance] makeBaseFileToPath:[_pathControl.URL path]];
    NSAlert *alt = nil;
    if(beOk){
        alt = [NSAlert alertWithMessageText:@"创建成功！" defaultButton:@"确定" alternateButton:nil otherButton:nil informativeTextWithFormat:@"生成文件%@.h %@.m到%@。",[_textFieldClassName stringValue],[_textFieldClassName stringValue],[_pathControl.URL path]];
    }else{
        alt = [NSAlert alertWithMessageText:@"创建失败！" defaultButton:@"确定" alternateButton:nil otherButton:nil informativeTextWithFormat:@"生成文件失败！"];
    }
    [alt runModal];
}

- (IBAction)btnMakeClicked:(id)sender
{
    NSLog(@"btnMakeClicked path = %@",[_pathControl.URL path]);
    BOOL beOk = [[WZC_DataModalParser getInstance] makeFileWithString:[_jsonDataTextView string] writeToPath:[_pathControl.URL path] withClassName:[_textFieldClassName stringValue] withParentClassName:[_textFieldParentClassName stringValue]];
    NSAlert *alt = nil;
    if(beOk){
        alt = [NSAlert alertWithMessageText:@"创建成功！" defaultButton:@"确定" alternateButton:nil otherButton:nil informativeTextWithFormat:@"生成文件%@.h %@.m到%@。",[_textFieldClassName stringValue],[_textFieldClassName stringValue],[_pathControl.URL path]];
    }else{
        alt = [NSAlert alertWithMessageText:@"创建失败！" defaultButton:@"确定" alternateButton:nil otherButton:nil informativeTextWithFormat:@"生成文件失败！"];
    }
    [alt runModal];
}

- (IBAction)btnSwiftMakeClicked:(id)sender {
    NSLog(@"btnMakeClicked path = %@",[_pathControl.URL path]);
    BOOL beOK = [[WZC_DataModalParser getInstance] makeSwiftFileWithString:[_jsonDataTextView string] writeToPath:@"/Users/Symond/Desktop/" withClassName:[_textFieldClassName stringValue] withParentClassName:[_textFieldParentClassName stringValue]];
    NSAlert *alt = nil;
    if(beOK){
        alt = [NSAlert alertWithMessageText:@"创建成功！" defaultButton:@"确定" alternateButton:nil otherButton:nil informativeTextWithFormat:@"生成文件%@.h %@.m到%@。",[_textFieldClassName stringValue],[_textFieldClassName stringValue],[_pathControl.URL path]];
    }else{
        alt = [NSAlert alertWithMessageText:@"创建失败！" defaultButton:@"确定" alternateButton:nil otherButton:nil informativeTextWithFormat:@"生成文件失败！"];
    }
    [alt runModal];
}


#pragma mark - NSPathControlDelegate



- (IBAction)btnConvertClicked:(id)sender
{
    NSString *strHexColor = [_textFieldhexRgb stringValue];
    if(strHexColor.length != 6){
        NSAlert *alt = [NSAlert alertWithMessageText:@"创建成功！" defaultButton:@"确定" alternateButton:nil otherButton:nil informativeTextWithFormat:@"输入的16进制色制格式有误!"];
        [alt runModal];
        return;
    }
    
    unsigned int red,green,blue;
    NSRange range;
    range.length = 2;
    range.location = 0;
    
    [[NSScanner scannerWithString:[strHexColor substringWithRange:range]] scanHexInt:&red];
    range.location = 2;
    [[NSScanner scannerWithString:[strHexColor substringWithRange:range]] scanHexInt:&green];
    range.location = 4;
    [[NSScanner scannerWithString:[strHexColor substringWithRange:range]] scanHexInt:&blue];
    
    [_textFieldR setStringValue:[NSString stringWithFormat:@"%d",red]];
    [_textFieldG setStringValue:[NSString stringWithFormat:@"%d",green]];
    [_textFieldB setStringValue:[NSString stringWithFormat:@"%d",blue]];

}

- (void)dealloc
{
    self.textFieldParentClassName = nil;
    self.textFieldClassName = nil;
    self.btnClear = nil;
    self.jsonDataTextView = nil;
    self.textFieldPath = nil;
    self.pathControl = nil;
    self.tabView = nil;
    self.textFieldhexRgb = nil;
    self.textFieldR = nil;
    self.textFieldG = nil;
    self.textFieldB = nil;
}

@end
