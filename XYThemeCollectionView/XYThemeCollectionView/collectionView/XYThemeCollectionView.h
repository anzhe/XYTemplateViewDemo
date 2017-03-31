//
//  XYThemeCollectionView.h
//  XYThemeCollectionView
//
//  Created by duxuan on 2017/3/27.
//  Copyright © 2017年 duxuan. All rights reserved.
//

#import <UIKit/UIKit.h>

UIKIT_EXTERN const NSString *mainCellID;
UIKIT_EXTERN const NSString *subCellID;

typedef NS_ENUM(NSUInteger, ThemeInfoType) {
    themeInfoTypeNormal,
    themeInfoTypeAD,
};

typedef NS_ENUM(NSUInteger, ThemeViewRotateType) {//normal is portrait
    ThemeViewRotateTypePortrait,
    ThemeViewRotateTypeLandscapeLR,//left or right
};

@interface XYSubThemeInfo : NSObject

@property (copy, nonatomic) NSString *themeTitle;
@property (copy, nonatomic) UIImage *themeIcon;
@property BOOL isSubThemeSelected;

@end

@interface XYMainThemeInfo : NSObject
@property (assign, nonatomic) ThemeInfoType themeInfoType;
@property (copy, nonatomic) NSString *themeTitle;
@property (copy, nonatomic) UIImage *themeIcon;
@property (strong, nonatomic) NSMutableArray <XYSubThemeInfo *>*subThemeInfoList;
@property BOOL isMainThemeSelected;

@end

@interface XYThemeCollectionView : UICollectionView

@property (nonatomic, readonly) ThemeViewRotateType themeViewRotateType;

- (void)initCollectionView:(NSMutableArray *)infoList;
- (void)setThemeRotateType:(ThemeViewRotateType)rotateType;

@end
