//
//  WZC_DataModalParser.h
//  IXcodeTool
//
//  Created by Symond on 14-4-24.
//  Copyright (c) 2014年 WZC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WZC_DataModalParser : NSObject
{

}

/**
 *  获取WZC_DataModalParser实例对像
 *
 *  @return 返回WZC_DataModalParser实例对像
 */
+ (WZC_DataModalParser *)getInstance;

/**
 *  通过指定的JSON数据，生成文件到指定路径
 *
 *  @param strJson 模板JSON数据
 *  @param strPath 生成文件的路径
 *  @param cn      生成的类的名字
 *  @param pcn     生成的类的父类的名字
 *
 *  @return 执行成功返回YES 否则NO
 */
- (BOOL)makeFileWithString:(NSString *)strJson writeToPath:(NSString *)strPath withClassName:(NSString *)cn withParentClassName:(NSString *)pcn;

/**
 *  通过指定的JSON数据，生成文件到指定路径
 *
 *  @param strJson 模板JSON数据
 *  @param strPath 生成文件的路径
 *  @param cn      生成的类的名字
 *  @param pcn     生成的类的父类的名字
 *
 *  @return 执行成功返回YES 否则NO
 */
- (BOOL)makeSwiftFileWithString:(NSString *)strJson writeToPath:(NSString *)strPath withClassName:(NSString *)cn withParentClassName:(NSString *)pcn;

- (BOOL)makeBaseFileToPath:(NSString *)strPath;

@end
