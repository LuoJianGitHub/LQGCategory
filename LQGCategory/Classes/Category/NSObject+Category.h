//
//  NSObject+Category.h
//  LQGCategory
//
//  Created by 罗建
//  Copyright (c) 2021 罗建. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <objc/runtime.h>

@interface NSObject (ReplaceMethod)

/// 方法的交换（优先检测实例方法）
/// @param oldSelector 原方法
/// @param newSelector 新方法
+ (BOOL)replaceMethodWithOldSelector:(SEL)oldSelector newSelector:(SEL)newSelector;

/// 类方法的交换
/// @param oldSelector 原方法
/// @param newSelector 新方法
+ (BOOL)replaceClassMethodWithOldSelector:(SEL)oldSelector newSelector:(SEL)newSelector;

/// 实例方法的交换
/// @param oldSelector 原方法
/// @param newSelector 新方法
+ (BOOL)replaceInstanceMethodWithOldSelector:(SEL)oldSelector newSelector:(SEL)newSelector;

@end
