//
//  UICollectionView+Category.m
//  LQGCategory
//
//  Created by 罗建
//  Copyright (c) 2021 罗建. All rights reserved.
//

#import "UICollectionView+Category.h"

@implementation UICollectionView (Register)

- (void)registerHeaderViewWithClass:(Class)viewClass isNib:(BOOL)isNib {
    if (!isNib) {
        [self registerClass:viewClass forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass(viewClass)];
    } else {
        [self registerNib:[UINib nibWithNibName:NSStringFromClass(viewClass) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass(viewClass)];
    }
}

- (void)registerFooterViewWithClass:(Class)viewClass isNib:(BOOL)isNib {
    if (!isNib) {
        [self registerClass:viewClass forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass(viewClass)];
    } else {
        [self registerNib:[UINib nibWithNibName:NSStringFromClass(viewClass) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass(viewClass)];
    }
}

- (void)registerCellWithClass:(Class)cellClass isNib:(BOOL)isNib {
    if (!isNib) {
        [self registerClass:cellClass forCellWithReuseIdentifier:NSStringFromClass(cellClass)];
    } else {
        [self registerNib:[UINib nibWithNibName:NSStringFromClass(cellClass) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass(cellClass)];
    }
}

@end
