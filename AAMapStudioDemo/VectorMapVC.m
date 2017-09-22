//
//  VectorMapVC.m
//  AAMapStudioDemo
//
//  Created by An An on 2017/9/22.
//  Copyright © 2017年 An An. All rights reserved.
//

#import "VectorMapVC.h"
@interface VectorMapVC ()

@end

@implementation VectorMapVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    AAVectorMapView *mapView = [[AAVectorMapView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    mapView.effectType = self.effectType;
    mapView.tapEnabled = YES;
    mapView.didTapBlock = ^(NSDictionary *tappedElementDic) {
        NSLog(@"🌺%@",tappedElementDic);
    };
    [self.view addSubview:mapView];
}

//Add many types of ripple effect sample code

@end
