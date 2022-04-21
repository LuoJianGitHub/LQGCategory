//
//  UINavigationBar+Category.m
//  LQGCategory
//
//  Created by 罗建
//  Copyright (c) 2021 罗建. All rights reserved.
//

#import "UINavigationBar+Category.h"

#import "NSObject+Category.h"

@implementation UINavigationBar (AdjustmentBarButtonItemSpaceForScreen)

+ (void)load {
    [self replaceMethodWithOldSelector:@selector(layoutSubviews)
                           newSelector:@selector(lqg_layoutSubviews)];
}

- (void)lqg_layoutSubviews {
    [self lqg_layoutSubviews];
    
    if (@available(iOS 11.0, *)) {
        // 调整左右间距
        self.layoutMargins = UIEdgeInsetsZero;
        for (UIView *subview in self.subviews) {
            if ([NSStringFromClass([subview class]) containsString:@"_UINavigationBarContentView"]) {
                if (@available(iOS 13.0, *)) {
                    UIEdgeInsets margins = subview.layoutMargins;
                    subview.frame = CGRectMake(-margins.left + 15, -margins.top, margins.left + margins.right + subview.frame.size.width - 30, margins.top + margins.bottom + subview.frame.size.height);
                } else {
                    subview.layoutMargins = UIEdgeInsetsMake(0, 15, 0, 15);
                }
                break;
            }
        }
    }

    // 调整布局
    if (self.bounds.size.height == 44.f) return;
    for (UIView *subview in self.subviews) {
        if([NSStringFromClass([subview class]) containsString:@"Background"]) {
            subview.frame = self.bounds;
        } else if ([NSStringFromClass([subview class]) containsString:@"ContentView"]) {
            CGRect frame = subview.frame;
            frame.origin.y = self.bounds.size.height - 44;
            frame.size.height = self.bounds.size.height - frame.origin.y;
            subview.frame = frame;
        }
    }
}

@end
