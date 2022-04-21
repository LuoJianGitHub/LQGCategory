//
//  UINavigationItem+Category.m
//  LQGCategory
//
//  Created by 罗建
//  Copyright (c) 2021 罗建. All rights reserved.
//

#import "UINavigationItem+Category.h"

#import "NSObject+Category.h"

@implementation UINavigationItem (AdjustmentBarButtonItemSpaceForScreen)

+ (void)load {
    if (@available(iOS 11.0, *)) return;
    Class class = objc_getClass("UINavigationItem");
    [class replaceMethodWithOldSelector:@selector(setLeftBarButtonItem:)
                            newSelector:@selector(lqg_setLeftBarButtonItem:)];
    [class replaceMethodWithOldSelector:@selector(setLeftBarButtonItems:)
                            newSelector:@selector(lqg_setLeftBarButtonItems:)];
    [class replaceMethodWithOldSelector:@selector(setRightBarButtonItem:)
                            newSelector:@selector(lqg_setRightBarButtonItem:)];
    [class replaceMethodWithOldSelector:@selector(setRightBarButtonItems:)
                            newSelector:@selector(lqg_setRightBarButtonItems:)];
}

- (void)lqg_setLeftBarButtonItem:(UIBarButtonItem *)leftBarButtonItem {
    [self setLeftBarButtonItems:leftBarButtonItem ? @[leftBarButtonItem] : nil];
}

- (void)lqg_setLeftBarButtonItems:(NSArray<UIBarButtonItem *> *)leftBarButtonItems {
    [self lqg_setLeftBarButtonItems:[self addSpaceBarButtonItem:leftBarButtonItems]];
}

- (void)lqg_setRightBarButtonItem:(UIBarButtonItem *)rightBarButtonItem {
    [self setRightBarButtonItems:rightBarButtonItem ? @[rightBarButtonItem] : nil];
}

- (void)lqg_setRightBarButtonItems:(NSArray<UIBarButtonItem *> *)rightBarButtonItems {
    [self lqg_setRightBarButtonItems:[self addSpaceBarButtonItem:rightBarButtonItems]];
}

- (NSArray<UIBarButtonItem *> *)addSpaceBarButtonItem:(NSArray<UIBarButtonItem *> *)barButtonItems {
    if (!barButtonItems || !barButtonItems.count) return nil;
    // 通过添加一个Item的方式来修改边缘item与屏幕的距离
    UIBarButtonItem *spaceBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    CGFloat currentSpace = 0.f; // 当前值
    if (barButtonItems.firstObject.title) {
        currentSpace = 8.f;
    } else {
        currentSpace = 16.f;
    }
    spaceBarButton.width = 15 - currentSpace;
    NSMutableArray *items = [barButtonItems mutableCopy];
    [items insertObject:spaceBarButton atIndex:0];
    return [items copy];
}

@end
