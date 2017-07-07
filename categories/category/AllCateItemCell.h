//
//  AllCateItemCell.h
//  categories
//
//  Created by 贺心元 on 2017/7/4.
//  Copyright © 2017年 ichina. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryListModel.h"

@interface AllCateItemCell : UICollectionViewCell

@property (strong, nonatomic) SecondaryCateModel*cateModel;

@property (nonatomic, strong) UIView *container;
@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *titleLabel;

@end
