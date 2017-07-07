//
//  AllCategoryListViewController.m
//  categories
//
//  Created by 贺心元 on 2017/7/4.
//  Copyright © 2017年 ichina. All rights reserved.
//

#import "AllCategoryListViewController.h"
#import "AllCateItemCell.h"
#import "AllCateItemHeaderView.h"
#import "AllCateItemFooterView.h"

#import "CategoryListModel.h"

#import "Header.h"


static NSString *reuseID = @"itemCell";
static NSString *sectionHeaderID = @"sectionHeader";
static NSString *sectionFooterID = @"sectionFooter";

@interface AllCategoryListViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>


@property (nonatomic, strong) NSMutableArray *cacheArr;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation AllCategoryListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"全部分类";
    self.view.backgroundColor = UIColorRGB(242, 242, 242);

    [self setupCollectionView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self reloadData];
}


- (void)setupCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake((SCREENWIDTH - 20.0)/ 4, 38);
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.headerReferenceSize = CGSizeMake((SCREENWIDTH - 20.0), 45);
    layout.footerReferenceSize = CGSizeMake((SCREENWIDTH - 20.0), 10);
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT ) collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor clearColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
    
    [_collectionView registerClass:[AllCateItemCell class] forCellWithReuseIdentifier:reuseID];
    [_collectionView registerClass:[AllCateItemHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:sectionHeaderID];
    [_collectionView registerClass:[AllCateItemFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:sectionFooterID];
}

- (void)reloadData
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"AllCategories" ofType:@"plist"];
    NSMutableArray *categories = [[NSMutableArray alloc]initWithContentsOfFile:plistPath];
    for (NSMutableDictionary *dic in categories){
        CategoryListModel *model = [[CategoryListModel alloc] initWithDictionary:dic];
        
        if (model.shopCategoryList.count > 0){
            int count  = (int)model.shopCategoryList.count;
            if (count > 8) {
                if ([self isHidden:model.name]) {
                    model.isHidden = NO;
                }else{
                    model.isHidden = YES;
                }
            }else{
                model.isHidden = NO;
            }
            int num =  count%4;
            if (num > 0) {
                for (int i = 0; i < (4 - num); i++) {
                    SecondaryCateModel *obj = [[SecondaryCateModel alloc] init];
                    [model.shopCategoryList addObject:obj];
                }
            }
        }else{
            
            model.isHidden = NO;
        }
        [self.dataArray addObject:model];
    }

    [_collectionView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)isHidden:(NSString *)name
{
    for (NSString *str in self.cacheArr){
        if ([str isEqualToString:name]) {
            return YES;
        }
    }
    
    return NO;
}




#pragma mark - <UICollectionViewDelegate, UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return _dataArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    CategoryListModel *model = _dataArray[section];
    
    if (model.shopCategoryList.count > 8 && model.isHidden == YES) {
        return 8;
    }
    return model.shopCategoryList.count;
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    AllCateItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseID forIndexPath:indexPath];
    
    CategoryListModel *model = _dataArray[indexPath.section];
    SecondaryCateModel *itemModel = model.shopCategoryList[indexPath.row];
    cell.cateModel = itemModel;
    
    if (model.shopCategoryList.count > 8 && model.isHidden == YES) {
        if (indexPath.row == 7) {
            [cell.titleLabel setHidden:YES];
            [cell.icon setHidden:NO];
        }else{
            [cell.titleLabel setHidden:NO];
            [cell.icon setHidden:YES];
        }
    }else{
        [cell.titleLabel setHidden:NO];
        [cell.icon setHidden:YES];
    }
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if (kind == UICollectionElementKindSectionHeader) {
        AllCateItemHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:sectionHeaderID forIndexPath:indexPath];
        
        CategoryListModel *model = _dataArray[indexPath.section];
        headerView.title = model.name;
        headerView.iconUrl = model.pic;
        
        return headerView;
    }else if (kind == UICollectionElementKindSectionFooter){
        
        AllCateItemFooterView *footView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:sectionFooterID forIndexPath:indexPath];
        
        return footView;
    }
    else {
        return nil;
    }
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(0, 10, 0, 10);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CategoryListModel *model = _dataArray[indexPath.section];
    SecondaryCateModel *itemModel = model.shopCategoryList[indexPath.row];

    if (indexPath.row == 7) {
        if (model.shopCategoryList.count > 8 && model.isHidden == YES) {
            
            [self.cacheArr addObject:model.name];
            [self.cacheArr writeToFile:ISHIDDEN_PATH atomically:NO];
            
            model.isHidden = NO;
            
            [collectionView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section]];
        }else{
            
            if (itemModel.shopCategoryId) {
                NSLog(@"%@",itemModel.name);
            }
        }
    }else{
        
        if (itemModel.shopCategoryId) {
            NSLog(@"%@",itemModel.name);
        }
    }
}



- (NSMutableArray *)cacheArr
{
    if (!_cacheArr) {
        _cacheArr = [NSMutableArray arrayWithContentsOfFile:ISHIDDEN_PATH];
        if (!_cacheArr) {
            _cacheArr = [NSMutableArray array];
        }
    }
    return _cacheArr;
}

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

@end
