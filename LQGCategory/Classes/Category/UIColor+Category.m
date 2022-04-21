//
//  UIColor+Category.m
//  LQGCategory
//
//  Created by 罗建
//  Copyright (c) 2021 罗建. All rights reserved.
//

#import "UIColor+Category.h"

#import "UIImage+Category.h"

@implementation UIColor (Init)

+ (UIColor *)colorWithR:(NSInteger)r g:(NSInteger)g b:(NSInteger)b {
    return [self colorWithR:r g:g b:b a:1.f];
}

+ (UIColor *)colorWithR:(NSInteger)r g:(NSInteger)g b:(NSInteger)b a:(CGFloat)a {
    return [UIColor colorWithRed:r / 255.f
                           green:g / 255.f
                            blue:b / 255.f
                           alpha:a];
}

+ (UIColor *)colorWithHex:(NSInteger)hex {
    return [UIColor colorWithHex:hex a:1.f];
}

+ (UIColor *)colorWithHex:(NSInteger)hex a:(CGFloat)a {
    return [UIColor colorWithR:(hex & 0xFF0000) >> 16
                             g:(hex & 0xFF00) >> 8
                             b:hex & 0xFF
                             a:a];
}

+ (UIColor *)colorWithHexString:(NSString *)hex {
    if ([hex hasPrefix:@"#"]) {
        hex = [hex substringFromIndex:1];
    } else if ([hex hasPrefix:@"0x"] ||
               [hex hasPrefix:@"0X"]) {
        hex = [hex substringFromIndex:2];
    }
    
    CGFloat alpha, red, green, blue;
    switch ([hex length]) {
        case 3: // #RGB
            alpha = 1.0f;
            red   = [self colorComponentFrom: hex start: 0 length: 1];
            green = [self colorComponentFrom: hex start: 1 length: 1];
            blue  = [self colorComponentFrom: hex start: 2 length: 1];
            break;
        case 4: // #ARGB
            alpha = [self colorComponentFrom: hex start: 0 length: 1];
            red   = [self colorComponentFrom: hex start: 1 length: 1];
            green = [self colorComponentFrom: hex start: 2 length: 1];
            blue  = [self colorComponentFrom: hex start: 3 length: 1];
            break;
        case 6: // #RRGGBB
            alpha = 1.0f;
            red   = [self colorComponentFrom: hex start: 0 length: 2];
            green = [self colorComponentFrom: hex start: 2 length: 2];
            blue  = [self colorComponentFrom: hex start: 4 length: 2];
            break;
        case 8: // #AARRGGBB
            alpha = [self colorComponentFrom: hex start: 0 length: 2];
            red   = [self colorComponentFrom: hex start: 2 length: 2];
            green = [self colorComponentFrom: hex start: 4 length: 2];
            blue  = [self colorComponentFrom: hex start: 6 length: 2];
            break;
        default:
            return nil;
    }
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (CGFloat)colorComponentFrom:(NSString *)string start:(NSUInteger)start length:(NSUInteger)length {
    NSString *substring = [string substringWithRange: NSMakeRange(start, length)];
    if (substring.length == 1) {
        substring = [NSString stringWithFormat: @"%@%@", substring, substring];
    }
    unsigned hexComponent;
    [[NSScanner scannerWithString:substring] scanHexInt:&hexComponent];
    return hexComponent / 255.0;
}

+ (UIColor *)gradientColorWithStartColor:(UIColor *)startcolor
                                endColor:(UIColor *)endColor
                               direction:(UIColorGradientDirection)direction
                                    Size:(CGSize)size {
    if (!startcolor || !endColor || CGSizeEqualToSize(size, CGSizeZero)) {
        return [UIColor clearColor];
    }
    return [UIColor colorWithPatternImage:[UIImage gradientImageWithStartColor:startcolor endColor:endColor direction:direction Size:size]];
}

@end
