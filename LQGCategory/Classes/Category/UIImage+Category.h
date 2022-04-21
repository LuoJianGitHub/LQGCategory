//
//  UIImage+Category.h
//  LQGCategory
//
//  Created by 罗建
//  Copyright (c) 2021 罗建. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, UIColorGradientDirection);

@interface UIImage (Init)

/// 获取特定bundle里面的图片
/// @param name 图片名称
/// @param aClass bundleForClass
/// @param resource URLForResource
+ (UIImage *)imageNamed:(NSString *)name bundleForClass:(Class)aClass URLForResource:(NSString *)resource;

/// 获取一定尺寸的纯色图片
/// @param size 大小
/// @param color 颜色
+ (UIImage *)imageWithSize:(CGSize)size color:(UIColor *)color;

/// 获取一定尺寸的渐变色图片
/// @param startcolor 开始颜色
/// @param endColor 结束颜色
/// @param direction 渐变方向
/// @param size 大小
+ (UIImage *)gradientImageWithStartColor:(UIColor *)startcolor
                                endColor:(UIColor *)endColor
                               direction:(UIColorGradientDirection)direction
                                    Size:(CGSize)size;

@end
