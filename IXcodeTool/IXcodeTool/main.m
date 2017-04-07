//
//  main.m
//  IXcodeTool
//
//  Created by Symond on 14-4-24.
//  Copyright (c) 2014年 WZC. All rights reserved.
//

#import <Cocoa/Cocoa.h>

int main(int argc, const char * argv[])
{
    @try {
        @autoreleasepool {
            return NSApplicationMain(argc, argv);
        }
    }
    @catch (NSException *exception) {
        NSLog(@"CRASH %@  %@",[exception reason],[exception callStackSymbols]);
    }
    @finally {
        
    }
    
    return NSApplicationMain(argc, argv);
}