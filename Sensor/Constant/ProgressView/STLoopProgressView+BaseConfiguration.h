//
//  STLoopProgressView+BaseConfiguration.h
//  STLoopProgressView
//
//  Created by TangJR on 7/1/15.
//  Copyright (c) 2015 tangjr. All rights reserved.
//

#import "STLoopProgressView.h"

@interface STLoopProgressView (BaseConfiguration)

+ (UIColor *)color1;
+ (UIColor *)color2;
+ (UIColor *)color3;
+ (UIColor *)color4;
+ (UIColor *)color5;
+ (UIColor *)color6;

+ (UIColor *)currentColorWithNum:(CGFloat)num;
+ (CGFloat)currentPercentWithNum:(CGFloat)num;

// 背景色
+ (UIColor *)backgroundColor;

// 线宽
+ (CGFloat)lineWidth;

// 起始角度（根据顺时针计算，逆时针则是结束角度）
+ (CGFloat)startAngle;

// 结束角度（根据顺时针计算，逆时针则是起始角度）
+ (CGFloat)endAngle;

// 进度条起始方向（YES为顺时针，NO为逆时针）
+ (STClockWiseType)clockWiseType;

@end
