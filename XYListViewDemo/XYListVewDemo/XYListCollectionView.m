//
//  XYListCollectionView.m
//  XYListVewDemo
//
//  Created by duxuan on 2017/4/1.
//  Copyright © 2017年 duxuan. All rights reserved.
//

#import "XYListCollectionView.h"
#import "XYListCollectionViewSubCell.h"
#import "XYListCollectionViewMainCell.h"
#import "UIColor+XYAdapter.h"

NSString *mainCellID = @"XYListCollectionViewMainCell";

@interface XYListCollectionView()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) NSArray *cellColorArray;

@end

@implementation XYListCollectionView

- (void)initAll{
    _cellColorArray = @[[UIColor colorWithHex:0x4facd8],[UIColor colorWithHex:0x5174d5],[UIColor colorWithHex:0xf0854a],[UIColor colorWithHex:0xf0bb4a],[UIColor colorWithHex:0xde5b89],[UIColor colorWithHex:0xa373e4]];
    [self registerNib:[UINib nibWithNibName:mainCellID bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:mainCellID];
    self.delegate = self;
    self.dataSource = self;
    [self reloadData];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    XYListCollectionViewMainCell *mainCell = [collectionView dequeueReusableCellWithReuseIdentifier:mainCellID forIndexPath:indexPath];
    [mainCell initSubCollectionView];
    int colorIndex = indexPath.item%6;
    mainCell.contentView.backgroundColor = [_cellColorArray objectAtIndex:colorIndex];
    return mainCell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(375, 250);
}


@end
