//
//  AllCateItemCell.m
//  categories
//
//  Created by 贺心元 on 2017/7/4.
//  Copyright © 2017年 ichina. All rights reserved.
//

#import "AllCateItemCell.h"

@implementation AllCateItemCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        CGFloat containerX = 0;
        CGFloat containerY = 0;
        CGFloat containerW = self.bounds.size.width - 2 * containerX;
        CGFloat containerH = self.bounds.size.height - 2 * containerY;
        _container = [[UIView alloc] initWithFrame:CGRectMake(containerX, containerY, containerW, containerH)];
        _container.backgroundColor = [UIColor whiteColor];
        _container.layer.borderWidth = 1 / [UIScreen mainScreen].scale;
        _container.layer.borderColor = [UIColor colorWithRed:232 / 255.0 green:232 / 255.0 blue:232 / 255.0 alpha:1.0].CGColor;
        
        _icon = [[UIImageView alloc] initWithFrame:CGRectMake(containerW / 2 - 5, containerH / 2 - 5, 10, 10)];
        _icon.image = [UIImage imageNamed:@"icon_donw"];
        [_icon setHidden:YES];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, containerW - 10, containerH - 10)];
        
        _titleLabel.textColor = [UIColor colorWithRed:102 / 255.0 green:102 / 255.0 blue:102 / 255.0 alpha:1.0];
        _titleLabel.font = [UIFont systemFontOfSize:13];
        _titleLabel.textAlignment = NSTextAlignmentCenter;

        [_container addSubview:_icon];
        [_container addSubview:_titleLabel];
        [self.contentView addSubview:_container];
        
    }
    return self;
}

- (void)setCateModel:(SecondaryCateModel *)cateModel
{
    _cateModel = cateModel;
    _titleLabel.text = cateModel.name;
}


@end
