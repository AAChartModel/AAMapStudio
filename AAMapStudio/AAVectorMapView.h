//
//  AAVectorMapView.h
//  AAMapStudioDemo
//
//  Created by An An on 2017/8/24.
//  Copyright © 2017年 apple. All rights reserved.
//  source code ----*** https://github.com/AAChartModel/AAMapStudio ***--- source code
//

/*
 
 * -------------------------------------------------------------------------------
 *
 * ❀❀❀   WARM TIPS!!!   ❀❀❀
 *
 * Please contact me on GitHub,if there are any problems encountered in use.
 * GitHub Issues : https://github.com/AAChartModel/AAMapStudio/issues
 * -------------------------------------------------------------------------------
 * And if you want to contribute for this project, please contact me as well
 * GitHub        : https://github.com/AAChartModel
 * StackOverflow : https://stackoverflow.com/users/7842508/codeforu
 * JianShu       : http://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import <UIKit/UIKit.h>
#import "AARippleView.h"

typedef NS_ENUM(NSInteger,AAMapRippleEffect) {
    AAMapRippleEffectRing = 0,       //环形涟漪效果
    AAMapRippleEffectSolidCircle,    //实心圆涟漪效果
    AAMapRippleEffectStaticBubble,   //静态气泡
    AAMapRippleEffectDynamicBubble,  //动态气泡
};

typedef NS_ENUM(NSInteger,AAMapDataType) {
    AAMapDataTypeWithoutLine = 0,  //没有连接线效果
    AAMapDataTypeWithLineExpand,   //有起始点和结束点连线效果(向外扩张)
    AAMapDataTypeWithLineShrink,   //有起始点结束点连线效果(向内收缩)
};


typedef void (^AAMapViewDidTapBlock)(NSDictionary *tappedElementDic);


@protocol AAMapViewDidTapDelegate <NSObject>

- (void)aaMapViewDidTapWithTappedElementDictionary:(NSDictionary *)tappedElementDic;

@end

@interface AAVectorMapView : UIView
@property (nonatomic, assign  ) AAMapDataType dataType;
@property (nonatomic, strong) NSArray *seriesDataArr;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, assign) CGFloat textFont;
@property (nonatomic, strong) UIColor *defaultBackgroundColor;
@property (nonatomic, assign) BOOL tapEnabled;       //用户是否可点击
@property (nonatomic, assign) NSUInteger selectedIdx;//选中的地图块
@property (nonatomic, assign) BOOL tooltipEnabled;//是否启用浮动提示框
@property (nonatomic, assign) AARippleEffect effectType;//涟漪效果样式

@property (nonatomic, weak  ) id<AAMapViewDidTapDelegate> didTapDelegate;//代理传值
@property (nonatomic, copy  ) AAMapViewDidTapBlock didTapBlock;//block 传值

@end


