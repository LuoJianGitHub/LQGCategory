//
//  UIViewController+Category.m
//  LQGCategory
//
//  Created by 罗建
//  Copyright (c) 2021 罗建. All rights reserved.
//

#import "UIViewController+Category.h"

@implementation UIViewController (CurrentController)

+ (UIViewController *)currentController {
    return [self currentController:[UIApplication sharedApplication].keyWindow.rootViewController];
}

+ (UIViewController *)currentController:(UIViewController *)viewController {
    if ([viewController presentedViewController]) {
        viewController = [viewController presentedViewController];
    }
    
    UIViewController *currentController;
    if ([viewController isKindOfClass:[UITabBarController class]]) {
        currentController = [self currentController:[(UITabBarController *)viewController selectedViewController]];
    } else if ([viewController isKindOfClass:[UINavigationController class]]){
        currentController = [self currentController:[(UINavigationController *)viewController visibleViewController]];
    } else {
        currentController = viewController;
    }
    
    return currentController;
}

@end
