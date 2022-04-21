//
//  UITableView+Category.h
//  LQGCategory
//
//  Created by 罗建
//  Copyright (c) 2021 罗建. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (Register)

/// HeaderFooterView注册重用
/// @param viewClass HeaderFooterView类
/// @param isNib 是否是XIB
- (void)registerHeaderFooterViewWithClass:(Class)viewClass isNib:(BOOL)isNib;

/// Cell注册重用
/// @param cellClass Cell类
/// @param isNib 是否是XIB
- (void)registerCellWithClass:(Class)cellClass isNib:(BOOL)isNib;

@end
