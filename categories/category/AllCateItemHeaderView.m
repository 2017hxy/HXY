//
//  AllCateItemHeaderView.m
//  categories
//
//  Created by 贺心元 on 2017/7/4.
//  Copyright © 2017年 ichina. All rights reserved.
//

#import "AllCateItemHeaderView.h"

@interface AllCateItemHeaderView ()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *iconImage;
@end

@implementation AllCateItemHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        
        _iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 15, 20, 20)];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 15, frame.size.width - 50, 20)];
        _titleLabel.textColor = [UIColor colorWithRed:51 / 255.0 green:51 / 255.0 blue:51 / 255.0 alpha:1.0];
        _titleLabel.font = [UIFont systemFontOfSize:16];
        
        [self addSubview:_iconImage];
        [self addSubview:_titleLabel];
    }
    return self;
}

- (void)setTitle:(NSString *)title {
    _title = title;
    _titleLabel.text = _title;
}

- (void)setIconUrl:(NSString *)iconUrl
{
    _iconUrl = iconUrl;
    _iconImage.image = [UIImage imageNamed:iconUrl];
    
//    [_iconImage sd_setImageWithURL:[NSURL URLWithString:_iconUrl] placeholderImage:[UIImage imageNamed:@""]];
}

@end
