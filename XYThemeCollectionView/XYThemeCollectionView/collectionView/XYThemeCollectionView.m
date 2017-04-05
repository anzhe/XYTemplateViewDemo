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

//@property (assign, nonatomic) ThemeViewRotateType themeViewRotateType;
@property (strong, nonatomic) NSMutableArray <XYMainThemeInfo *>*themeInfoList;
@property (assign, nonatomic) CGSize mainCellSize;
@property (assign, nonatomic) CGSize subCellSize;


@end

@implementation XYThemeCollectionView

- (void)initCollectionView:(NSMutableArray *)infoList{
    _themeInfoList = infoList;
    _themeViewRotateType = ThemeViewRotateTypePortrait;
    _subCellSize = CGSizeMake(100, 124);
    _mainCellSize = CGSizeMake(100, 130);
    
    [self registerNib:[UINib nibWithNibName:mainCellID bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:mainCellID];
    [self registerNib:[UINib nibWithNibName:subCellID bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:subCellID];
    self.delegate = self;
    self.dataSource = self;
//    self.scrollEnabled = NO;
    [self reloadData];
}

- (void)setThemeRotateType:(ThemeViewRotateType)rotateType{
    _themeViewRotateType = rotateType;
//    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//    if ( rotateType == ThemeViewRotateTypePortrait ) {
//        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//    }else{
//        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
//    }
//    [self setCollectionViewLayout:layout animated:YES];
    [self reloadData];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    XYThemeCollectionViewMainCell *mainCell = [collectionView dequeueReusableCellWithReuseIdentifier:mainCellID forIndexPath:indexPath];
    XYThemeCollectionViewSubCell *subCell = [collectionView dequeueReusableCellWithReuseIdentifier:subCellID forIndexPath:indexPath];
    if ( _themeViewRotateType == ThemeViewRotateTypePortrait ) {
        mainCell.transform = CGAffineTransformMakeRotation(0);
        subCell.transform = CGAffineTransformMakeRotation(0);
    }else{
        subCell.transform = CGAffineTransformMakeRotation(-M_PI/2);
        mainCell.transform = CGAffineTransformMakeRotation(-M_PI/2);
    }
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
    if ( _themeViewRotateType == ThemeViewRotateTypePortrait ) {
        return UIEdgeInsetsMake(5, 5, 5, 5);
    }else{
        return UIEdgeInsetsMake(5, 20, 5, 20);
    }
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    if ( _themeViewRotateType == ThemeViewRotateTypePortrait ) {
        return 0;
    }else{
        return 40;
    }
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    if ( _themeViewRotateType == ThemeViewRotateTypePortrait ) {
        return 10;
    }else{
        return 40;
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    XYMainThemeInfo *mainThemeInfo = _themeInfoList[indexPath.section];
    if ( mainThemeInfo.themeInfoType == themeInfoTypeAD ) {//可以用switch 后面如果扩展
        return;
    }
    
    if ( [self isFirstTheme:indexPath] ) {
        mainThemeInfo.isMainThemeSelected = !mainThemeInfo.isMainThemeSelected;
//        [self reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section]];
        
        [_themeInfoList enumerateObjectsUsingBlock:^(XYMainThemeInfo * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ( idx != indexPath.section && obj.isMainThemeSelected ) {
                obj.isMainThemeSelected = !obj.isMainThemeSelected;
//                [self reloadSections:[NSIndexSet indexSetWithIndex:idx]];
                *stop = YES;
            }
        }];
        
        [self reloadData];
        UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:indexPath.section]];
        if ( attributes == nil ) {
            return;
        }
        CGRect rect = attributes.frame;
        if ( _themeViewRotateType == ThemeViewRotateTypePortrait ) {
            [self setContentOffset:CGPointMake(rect.origin.x-5, 0) animated:YES];
        }else{
            [self setContentOffset:CGPointMake(rect.origin.x-20, 0) animated:YES];
        }
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
