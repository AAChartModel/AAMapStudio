//
//  AAVectorMapView.h
//  AAMapStudioDemo
//
//  Created by An An on 2017/8/24.
//  Copyright © 2017年 apple. All rights reserved.
//  source code ----*** https://github.com/AAChartModel/AAMapStudio ***--- source code
//

#import <UIKit/UIKit.h>
#import "AARippleView.h"

typedef NS_ENUM(NSInteger,AAMapRippleEffect) {
    AAMapRippleEffectRing = 0,       //环形涟漪效果
    AAMapRippleEffectSolidCircle,    //实心圆涟漪效果
    AAMapRippleEffectStaticBubble,   //静态气泡
    AAMapRippleEffectDynamicBubble,  //动态气泡
};


typedef void (^AAMapViewDidTapBlock)(NSDictionary *tappedElementDic);


@protocol AAMapViewDidTapDelegate <NSObject>

- (void)aaMapViewDidTapWithTappedElementDictionary:(NSDictionary *)tappedElementDic;

@end

@interface AAVectorMapView : UIView
@property (nonatomic, strong) NSArray *seriesDataArr;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, assign) CGFloat textFont;
@property (nonatomic, assign) BOOL tapEnabled;       //用户是否可点击
@property (nonatomic, assign) NSUInteger selectedIdx;//选中的地图块
@property (nonatomic, assign) BOOL tooltipEnabled;//是否启用浮动提示框
@property (nonatomic, assign) AARippleEffect effectType;//涟漪效果样式

@property (nonatomic, weak  ) id<AAMapViewDidTapDelegate> didTapDelegate;//代理传值
@property (nonatomic, copy  ) AAMapViewDidTapBlock didTapBlock;//block 传值

@end


