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

NSString *mainCellID = @"XYThemeCollectionViewSubCell";
NSString *subCellID = @"XYThemeCollectionViewMainCell";

@interface XYThemeCollectionView()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end

@implementation XYThemeCollectionView

- (void)initUI{
    [self registerNib:[UINib nibWithNibName:mainCellID bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:mainCellID];
    [self registerNib:[UINib nibWithNibName:subCellID bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:subCellID];
    self.delegate = self;
    self.dataSource = self;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 1;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

@end
