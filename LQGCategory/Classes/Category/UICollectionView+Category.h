//
//  UICollectionView+Category.h
//  LQGCategory
//
//  Created by 罗建
//  Copyright (c) 2021 罗建. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionView (Register)

/// HeaderView注册重用
/// @param viewClass HeaderView类
/// @param isNib 是否是XIB
- (void)registerHeaderViewWithClass:(Class)viewClass isNib:(BOOL)isNib;

/// FooterView注册重用
/// @param viewClass FooterView类
/// @param isNib 是否是XIB
- (void)registerFooterViewWithClass:(Class)viewClass isNib:(BOOL)isNib;

/// Cell注册重用
/// @param cellClass Cell类
/// @param isNib 是否是XIB
- (void)registerCellWithClass:(Class)cellClass isNib:(BOOL)isNib;

@end
