//
//  CategoryListModel.h
//  categories
//
//  Created by 贺心元 on 2017/7/4.
//  Copyright © 2017年 ichina. All rights reserved.
//

#import "JSONModel.h"

@interface CategoryListModel : JSONModel

@property (copy, nonatomic) NSString *shopClassId;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *pic;
@property (copy, nonatomic) NSString *sort;
@property (copy, nonatomic) NSMutableArray *shopCategoryList;
@property (nonatomic) BOOL isHidden;

@end


@interface SecondaryCateModel : JSONModel

@property (copy, nonatomic) NSString *shopCategoryId;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *sort;
@property (copy, nonatomic) NSString *shopCount;


@end
