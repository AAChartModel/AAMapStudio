//
//  ChinaMapWithName.h
//  TestWebView
//
//  Created by apple on 17/1/5.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>


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

@property (nonatomic, assign) BOOL tapEnabled;       //用户是否可点击
@property (nonatomic, assign) NSUInteger selectedIdx;//选中的地图块
@property (nonatomic, assign) BOOL tooltipEnabled;//是否启用浮动提示框
@property (nonatomic, weak  ) id<AAMapViewDidTapDelegate> didTapDelegate;//代理传值
@property (nonatomic, copy  ) AAMapViewDidTapBlock didTapBlock;//block 传值

@end

