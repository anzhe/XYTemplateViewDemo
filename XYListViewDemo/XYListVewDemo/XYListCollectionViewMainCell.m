//
//  XYListCollectionViewMainCell.m
//  XYListVewDemo
//
//  Created by duxuan on 2017/4/1.
//  Copyright © 2017年 duxuan. All rights reserved.
//

#import "XYListCollectionViewMainCell.h"
#import "XYListSubCollectionView.h"

@interface XYListCollectionViewMainCell()
@property (weak, nonatomic) IBOutlet XYListSubCollectionView *listSubCollectionView;

@end

@implementation XYListCollectionViewMainCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)initSubCollectionView{
    [self.listSubCollectionView initAll];
}

@end
