//
//  NSObject+Category.m
//  LQGCategory
//
//  Created by 罗建
//  Copyright (c) 2021 罗建. All rights reserved.
//

#import "NSObject+Category.h"

@implementation NSObject (ReplaceMethod)

+ (BOOL)replaceMethodWithOldSelector:(SEL)oldSelector newSelector:(SEL)newSelector {
    BOOL success = [self replaceInstanceMethodWithOldSelector:oldSelector newSelector:newSelector];
    if (!success) {
        success = [self replaceClassMethodWithOldSelector:oldSelector newSelector:newSelector];
    }
    return success;
}

+ (BOOL)replaceClassMethodWithOldSelector:(SEL)oldSelector newSelector:(SEL)newSelector {
    return [self replaceMethodWithIsInstance:NO oldSelector:oldSelector newSelector:newSelector];
}

+ (BOOL)replaceInstanceMethodWithOldSelector:(SEL)oldSelector newSelector:(SEL)newSelector {
    return [self replaceMethodWithIsInstance:YES oldSelector:oldSelector newSelector:newSelector];
}

+ (BOOL)replaceMethodWithIsInstance:(BOOL)isInstance oldSelector:(SEL)oldSelector newSelector:(SEL)newSelector {
    Method oldMethod, newMethod;
    if (isInstance) {
        // 获取实例方法
        oldMethod = class_getInstanceMethod(self, oldSelector);
        newMethod = class_getInstanceMethod(self, newSelector);
    } else {
        // 获取类方法
        oldMethod = class_getClassMethod(self, oldSelector);
        newMethod = class_getClassMethod(self, newSelector);
    }
    BOOL success = oldMethod && newMethod;
    if (success) {
        if (class_addMethod(self, oldSelector, method_getImplementation(newMethod), method_getTypeEncoding(newMethod))) {
            class_replaceMethod(self, newSelector, method_getImplementation(oldMethod), method_getTypeEncoding(oldMethod));
        } else {
            method_exchangeImplementations(oldMethod, newMethod);
        }
    }
    return success;
}

@end
