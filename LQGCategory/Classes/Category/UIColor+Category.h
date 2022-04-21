//
//  UIColor+Category.h
//  LQGCategory
//
//  Created by 罗建
//  Copyright (c) 2021 罗建. All rights reserved.
//

/**
 渐变方式
 
 - UIColorGradientDirection: 水平渐变
 - UIColorGradientDirection: 竖直渐变
 - UIColorGradientDirection: 向下对角线渐变
 - UIColorGradientDirection: 向上对角线渐变
 */
typedef NS_ENUM(NSInteger, UIColorGradientDirection) {
    UIColorGradientDirectionHorizontal,
    UIColorGradientDirectionVertical,
    UIColorGradientDirectionUpwardDiagonalLine,
    UIColorGradientDirectionDownDiagonalLine,
};

#import <UIKit/UIKit.h>

@interface UIColor (Init)

+ (UIColor *)colorWithR:(NSInteger)r g:(NSInteger)g b:(NSInteger)b;

+ (UIColor *)colorWithR:(NSInteger)r g:(NSInteger)g b:(NSInteger)b a:(CGFloat)a;

+ (UIColor *)colorWithHex:(NSInteger)hex;

+ (UIColor *)colorWithHex:(NSInteger)hex a:(CGFloat)a;

+ (UIColor *)colorWithHexString:(NSString *)hex;

/// 获取渐变色（消耗性能，最好别用）
/// @param startcolor 开始颜色
/// @param endColor 结束颜色
/// @param direction 渐变方向
/// @param size 大小
+ (UIColor *)gradientColorWithStartColor:(UIColor *)startcolor
                                endColor:(UIColor *)endColor
                               direction:(UIColorGradientDirection)direction
                                    Size:(CGSize)size;

@end
