//
//  UIImage+Category.m
//  LQGCategory
//
//  Created by 罗建
//  Copyright (c) 2021 罗建. All rights reserved.
//

#import "UIImage+Category.h"

#import "UIColor+Category.h"

@implementation UIImage (Init)

+ (UIImage *)imageNamed:(NSString *)name bundleForClass:(Class)aClass URLForResource:(NSString *)resource {
    // bundle
    NSBundle *imageBundle = [NSBundle bundleForClass:aClass];
    NSURL *url = [imageBundle URLForResource:resource withExtension:@"bundle"];
    imageBundle = [NSBundle bundleWithURL:url];
    // image
    name = [name stringByAppendingString:@"@2x"];
    NSString *imagePath = [imageBundle pathForResource:name ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
    if (!image) {
        // 兼容业务方自己设置图片的方式
        name = [name stringByReplacingOccurrencesOfString:@"@2x" withString:@""];
        image = [UIImage imageNamed:name];
    }
    return image;
}

+ (UIImage *)imageWithSize:(CGSize)size color:(UIColor *)color {
    CGRect frame = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, frame);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)gradientImageWithStartColor:(UIColor *)startcolor
                                endColor:(UIColor *)endColor
                               direction:(UIColorGradientDirection)direction
                                    Size:(CGSize)size {
    if (!startcolor || !endColor || CGSizeEqualToSize(size, CGSizeZero)) return nil;
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(0, 0, size.width, size.height);
    gradientLayer.colors = @[(__bridge id)startcolor.CGColor, (__bridge id)endColor.CGColor];
    gradientLayer.startPoint = ({
        CGPoint startPoint = CGPointZero;
        if (direction == UIColorGradientDirectionDownDiagonalLine) {
            startPoint = CGPointMake(0.0, 1.0);
        }
        startPoint;
    });
    gradientLayer.endPoint = ({
        CGPoint endPoint = CGPointZero;
        switch (direction) {
            case UIColorGradientDirectionHorizontal:
                endPoint = CGPointMake(1.0, 0.0);
                break;
            case UIColorGradientDirectionVertical:
                endPoint = CGPointMake(0.0, 1.0);
                break;
            case UIColorGradientDirectionUpwardDiagonalLine:
                endPoint = CGPointMake(1.0, 1.0);
                break;
            case UIColorGradientDirectionDownDiagonalLine:
                endPoint = CGPointMake(1.0, 0.0);
                break;
            default:
                break;
        }
        endPoint;
    });
    
    UIGraphicsBeginImageContext(size);
    [gradientLayer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage*image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
