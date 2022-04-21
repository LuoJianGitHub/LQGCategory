//
//  UITableView+Category.m
//  LQGCategory
//
//  Created by 罗建
//  Copyright (c) 2021 罗建. All rights reserved.
//

#import "UITableView+Category.h"

@implementation UITableView (Register)

- (void)registerHeaderFooterViewWithClass:(Class)viewClass isNib:(BOOL)isNib {
    if (!isNib) {
        [self registerClass:viewClass forHeaderFooterViewReuseIdentifier:NSStringFromClass(viewClass)];
    } else {
        [self registerNib:[UINib nibWithNibName:NSStringFromClass(viewClass) bundle:nil] forHeaderFooterViewReuseIdentifier:NSStringFromClass(viewClass)];
    }
}

- (void)registerCellWithClass:(Class)cellClass isNib:(BOOL)isNib {
    if (!isNib) {
        [self registerClass:cellClass forCellReuseIdentifier:NSStringFromClass(cellClass)];
    } else {
        [self registerNib:[UINib nibWithNibName:NSStringFromClass(cellClass) bundle:nil] forCellReuseIdentifier:NSStringFromClass(cellClass)];
    }
}

@end
