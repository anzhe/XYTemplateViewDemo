//
//  XYListSubCollectionView.m
//  XYListVewDemo
//
//  Created by duxuan on 2017/4/1.
//  Copyright © 2017年 duxuan. All rights reserved.
//

#import "XYListSubCollectionView.h"
#import "XYListCollectionViewSubCell.h"

NSString *subCellID = @"XYListCollectionViewSubCell";

@interface XYListSubCollectionView()<UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) NSArray *cellColorArray;

@end

@implementation XYListSubCollectionView

- (void)initAll{
    _cellColorArray = @[[UIColor redColor], [UIColor greenColor]];
    [self registerNib:[UINib nibWithNibName:subCellID bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:subCellID];
    self.delegate = self;
    self.dataSource = self;
    [self reloadData];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    XYListCollectionViewSubCell *subCell = [collectionView dequeueReusableCellWithReuseIdentifier:subCellID forIndexPath:indexPath];
    int colorIndex = indexPath.item%2;
    subCell.bgView.backgroundColor = [_cellColorArray objectAtIndex:colorIndex];
    return subCell;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 2;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(375, 250);
}

@end
