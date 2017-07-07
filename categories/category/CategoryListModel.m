//
//  CategoryListModel.m
//  categories
//
//  Created by 贺心元 on 2017/7/4.
//  Copyright © 2017年 ichina. All rights reserved.
//

#import "CategoryListModel.h"

@implementation CategoryListModel

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        
    }
    
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if([key isEqualToString:@"pic"]){
        
        _pic = [NSString stringWithFormat:@"%@",value];//ImagePath
        
    }else{
        [super setValue:value forUndefinedKey:key];
    }
}


-(void) setValue:(id)value forKey:(NSString *)key
{
     if ([key isEqualToString:@"shopCategoryList"]){
        
        _shopCategoryList = [NSMutableArray array];
        
        for(NSMutableDictionary *dict in value)
        {
            SecondaryCateModel *sub = [[SecondaryCateModel alloc] initWithDictionary:dict];
            [_shopCategoryList addObject:sub];
        }
         
    }else{
        [super setValue:value forKey:key];
    }
    
}

@end


@implementation SecondaryCateModel

@end


