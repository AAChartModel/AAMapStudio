//
//  AARipple.h
//  AARipple
//
//  Created by An An on 2017/8/24.
//  Copyright © 2017年 An An. All rights reserved.
//  source code ----*** https://github.com/AAChartModel/AAMapStudio ***--- source code
//

#import <UIKit/UIKit.h>

@interface AARippleView : UIView

typedef NS_ENUM(NSInteger,AARippleEffect){
    AARippleEffectRing = 0,
    AARippleEffectSolidCircle,
    AARippleEffectStaticBubble,
    AARippleEffectDynamicBubble,
};

@property (nonatomic, assign) AARippleEffect effectType;

- (void)startAnimation;
- (void)stopAnimation;

@end
