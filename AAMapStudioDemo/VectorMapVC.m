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
//    NSArray *seriesDataArr = @[@"湖北",@"黑龙江",@"辽宁",@"浙江",@"江西"];

    

  
    
    if (_effectType <=3) {
        //用于描述空气质量状况、全国各省人均收入分布等
        NSArray *data1 = @[
                           @{@"name":@"安徽",@"value":@95},
                           @{@"name":@"浙江",@"value":@188},
                           @{@"name":@"湖北",@"value":@33},
                           @{@"name":@"河南",@"value":@29},
                           ];
        mapView.dataType = AAMapDataTypeWithoutLine;
        mapView.seriesDataArr = data1;
    } else {
        //用于描述迁徙路线等
        NSArray *data2 = @[
                           @[@{@"name":@"西藏"}, @{@"name":@"安徽",@"value":@95}],
                           @[@{@"name":@"西藏"}, @{@"name":@"浙江",@"value":@188}],
                           @[@{@"name":@"西藏"}, @{@"name":@"湖北",@"value":@33}],
                           @[@{@"name":@"西藏"}, @{@"name":@"河南",@"value":@29}],
                           @[@{@"name":@"西藏"}, @{@"name":@"黑龙江",@"value":@29}],
                           @[@{@"name":@"西藏"}, @{@"name":@"辽宁",@"value":@29}],
                           @[@{@"name":@"西藏"}, @{@"name":@"澳门",@"value":@29}],
                           ];
        mapView.dataType = AAMapDataTypeWithLineExpand;
        mapView.seriesDataArr = data2;
    }

    mapView.effectType = self.effectType;
    mapView.tapEnabled = YES;
    mapView.didTapBlock = ^(NSDictionary *tappedElementDic) {
        NSLog(@"🌺%@",tappedElementDic);
    };
    [self.view addSubview:mapView];
    


    
    //妖艳色彩数组 @[@"#49C1B6", @"#FDC20A", @"#F78320", @"#068E81", @"#EA007B"],
}

//Add many types of ripple effect sample code

@end
