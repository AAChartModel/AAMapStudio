//
//  ViewController.m
//  AAMapStudioDemo
//
//  Created by An An on 2017/8/28.
//  Copyright © 2017年 An An. All rights reserved.
//

#import "ViewController.h"
#import "AAVectorMapView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AAVectorMapView *mapView = [[AAVectorMapView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    mapView.tapEnabled = YES;
    mapView.didTapBlock = ^(NSDictionary *tappedElementDic) {
        NSLog(@"🌺%@",tappedElementDic);
    };
    [self.view addSubview:mapView];
    
    
    
 }




@end
