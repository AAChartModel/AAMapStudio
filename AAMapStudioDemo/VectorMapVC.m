//
//  VectorMapVC.m
//  AAMapStudioDemo
//
//  Created by An An on 2017/9/22.
//  Copyright © 2017年 An An. All rights reserved.
//  source code ----*** https://github.com/AAChartModel/AAMapStudio ***--- source code
//

#import "VectorMapVC.h"
@interface VectorMapVC ()

@end

@implementation VectorMapVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    AAVectorMapView *mapView = [[AAVectorMapView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    NSArray *seriesDataArr = @[@"湖北",@"黑龙江",@"辽宁",@"浙江",@"江西"];
    mapView.seriesDataArr = seriesDataArr;
    mapView.effectType = self.effectType;
    mapView.tapEnabled = YES;
    mapView.didTapBlock = ^(NSDictionary *tappedElementDic) {
        NSLog(@"🌺%@",tappedElementDic);
    };
    [self.view addSubview:mapView];
}

//Add many types of ripple effect sample code

@end
