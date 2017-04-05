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
    _cellColorArray = @[[UIColor blueColor], [UIColor blackColor], [UIColor greenColor], [UIColor yellowColor], [UIColor redColor], [UIColor orangeColor]];
    [self registerNib:[UINib nibWithNibName:subCellID bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:subCellID];
    self.delegate = self;
    self.dataSource = self;
    [self reloadData];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    XYListCollectionViewSubCell *subCell = [collectionView dequeueReusableCellWithReuseIdentifier:subCellID forIndexPath:indexPath];
    int colorIndex = indexPath.item%6;
    subCell.bgView.backgroundColor = [_cellColorArray objectAtIndex:colorIndex];
    return subCell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(50, 250);
}

@end
