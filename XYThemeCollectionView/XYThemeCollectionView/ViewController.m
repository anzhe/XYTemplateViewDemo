//
//  ViewController.m
//  XYThemeCollectionView
//
//  Created by duxuan on 2017/3/27.
//  Copyright © 2017年 duxuan. All rights reserved.
//

#import "ViewController.h"
#import "XYThemeCollectionView.h"

int infoCount = 10;

@interface ViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *themeWidthConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *themeHeightConstraint;
@property (weak, nonatomic) IBOutlet XYThemeCollectionView *themeCollectionView;
@property (strong, nonatomic) NSMutableArray *themeInfoList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initDataSource];
    [self initUI];
    // Do any additional setup after loading the view, typically from a nib.
}

- (BOOL)shouldAutorotate{
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initDataSource{
    _themeInfoList = [NSMutableArray array];
    NSArray *subThemeNameArary = @[@"Blend",@"Blend",@"Blend",@"Blend",@"Blend",@"Blend"];
    for (int i = 0; i<=infoCount; i++) {
        XYMainThemeInfo *themeInfo = [[XYMainThemeInfo alloc]init];
        themeInfo.themeTitle = @"Subtle";
        themeInfo.themeIcon = [UIImage imageNamed:@"vivavideo_user_n"];
        for (NSString *name in subThemeNameArary) {
            XYSubThemeInfo *subThemeInfo = [[XYSubThemeInfo alloc]init];
            subThemeInfo.themeTitle = name;
            subThemeInfo.themeIcon = [UIImage imageNamed:@"vivavideo_pop_n"];
            [themeInfo.subThemeInfoList addObject:subThemeInfo];
        }
        [_themeInfoList addObject:themeInfo];
    }
}

- (void)initUI{
    [self.themeCollectionView initCollectionView:_themeInfoList];
}

- (IBAction)onClickChangeRotateBtn:(id)sender {
//    CGFloat themeWidth = [self themeViewRotateIsPortrait]?140:375;
//    CGFloat themeHight = [self themeViewRotateIsPortrait]?375:140;
//    self.themeWidthConstraint.constant = themeWidth;
//    self.themeHeightConstraint.constant = themeHight;
    
    ThemeViewRotateType type = [self themeViewRotateIsPortrait]?ThemeViewRotateTypeLandscapeLR:ThemeViewRotateTypePortrait;
    [self.themeCollectionView setThemeRotateType:type];
    
//    NSNumber *value = [self themeViewRotateIsPortrait]?[NSNumber numberWithInt:UIDeviceOrientationLandscapeLeft]:[NSNumber numberWithInt:UIInterfaceOrientationPortrait];
//    [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
}

- (BOOL)themeViewRotateIsPortrait{
    if ( self.themeCollectionView.themeViewRotateType == ThemeViewRotateTypePortrait ) {
        return YES;
    }else{
        return NO;
    }
}

@end
