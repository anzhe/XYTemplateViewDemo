//
//  ViewController.m
//  XYListVewDemo
//
//  Created by duxuan on 2017/3/31.
//  Copyright © 2017年 duxuan. All rights reserved.
//

#import "ViewController.h"
#import "XYListCollectionView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet XYListCollectionView *listCollectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_listCollectionView initAll];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
