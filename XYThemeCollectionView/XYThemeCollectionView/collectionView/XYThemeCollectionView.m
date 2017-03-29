//
//  XYThemeCollectionView.m
//  XYThemeCollectionView
//
//  Created by duxuan on 2017/3/27.
//  Copyright © 2017年 duxuan. All rights reserved.
//

#import "XYThemeCollectionView.h"
#import "XYThemeCollectionViewSubCell.h"
#import "XYThemeCollectionViewMainCell.h"

NSString *mainCellID = @"XYThemeCollectionViewMainCell";
NSString *subCellID = @"XYThemeCollectionViewSubCell";

@implementation XYSubThemeInfo
@end
@implementation XYMainThemeInfo
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.subThemeInfoList = [NSMutableArray array];
    }
    return self;
}
@end

@interface XYThemeCollectionView()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) NSMutableArray <XYMainThemeInfo *>*themeInfoList;
@property (assign, nonatomic) CGSize mainCellSize;
@property (assign, nonatomic) CGSize subCellSize;


@end

@implementation XYThemeCollectionView

- (void)initCollectionView:(NSMutableArray *)infoList{
    _themeInfoList = infoList;
    _subCellSize = CGSizeMake(100, 124);
    _mainCellSize = CGSizeMake(100, 130);
    [self registerNib:[UINib nibWithNibName:mainCellID bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:mainCellID];
    [self registerNib:[UINib nibWithNibName:subCellID bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:subCellID];
    self.delegate = self;
    self.dataSource = self;
    [self reloadData];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    XYThemeCollectionViewMainCell *mainCell = [collectionView dequeueReusableCellWithReuseIdentifier:mainCellID forIndexPath:indexPath];
    XYThemeCollectionViewSubCell *subCell = [collectionView dequeueReusableCellWithReuseIdentifier:subCellID forIndexPath:indexPath];
    XYMainThemeInfo *mainThemeInfo = _themeInfoList[indexPath.section];
    if ( mainThemeInfo.isMainThemeSelected ) {
        if ( [self isFirstTheme:indexPath] ) {
            return mainCell;
        }else{
            XYSubThemeInfo *subInfo = [mainThemeInfo.subThemeInfoList objectAtIndex:indexPath.row-1];//row == 0 is mainInfo else so -1
            subCell.subThemeImageView.image = subInfo.themeIcon;
            return subCell;
        }
    }else{
        return mainCell;
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    XYMainThemeInfo *mainThemeInfo = _themeInfoList[section];
    if ( mainThemeInfo.isMainThemeSelected ) {
        return _themeInfoList[section].subThemeInfoList.count;
    }else{
        return 1;
    }
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return _themeInfoList.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    XYMainThemeInfo *mainThemeInfo = _themeInfoList[indexPath.section];
    if ( mainThemeInfo.isMainThemeSelected ) {
        if ( [self isFirstTheme:indexPath] ) {
            return CGSizeMake(100, 130);
        }else{
            return CGSizeMake(100, 124);
        }
    }else{
        return CGSizeMake(100, 130);
    }
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    XYMainThemeInfo *mainThemeInfo = _themeInfoList[indexPath.section];
    if ( mainThemeInfo.themeInfoType == themeInfoTypeAD ) {//可以用switch 后面如果扩展
        return;
    }
    [_themeInfoList enumerateObjectsUsingBlock:^(XYMainThemeInfo * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ( idx != indexPath.section && obj.isMainThemeSelected ) {
            obj.isMainThemeSelected = !obj.isMainThemeSelected;
            [self reloadSections:[NSIndexSet indexSetWithIndex:idx]];
            *stop = YES;
        }
    }];
    
    UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:indexPath.section]];
    if ( attributes == nil ) {
        return;
    }
    CGRect rect = attributes.frame;
    [self setContentOffset:CGPointMake(rect.origin.x-5, 0) animated:YES];
    
    if ( [self isFirstTheme:indexPath] ) {
        mainThemeInfo.isMainThemeSelected = !mainThemeInfo.isMainThemeSelected;
        [self reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section]];
    }else{
        
    }
}

- (BOOL)isFirstTheme:(NSIndexPath *)indexPath{
    BOOL isFirstTheme = NO;
    if ( indexPath.item == 0 ) {
        isFirstTheme = YES;
    }
    return isFirstTheme;
}

@end
