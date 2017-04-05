//
//  UIColor+XYAdapter.m
//  XYListVewDemo
//
//  Created by duxuan on 2017/4/1.
//  Copyright © 2017年 duxuan. All rights reserved.
//

#import "UIColor+XYAdapter.h"

@implementation UIColor (XYAdapter)

#pragma mark - color with hex
+ (UIColor *) colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue
{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0
                           alpha:alphaValue];
}

+ (UIColor *) colorWithHex:(NSInteger)hexValue
{
    return [UIColor colorWithHex:hexValue alpha:1.0];
}

@end
