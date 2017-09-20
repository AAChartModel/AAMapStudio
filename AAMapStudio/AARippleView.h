//
//  AARipple.h
//  AARipple
//
//  Created by An An on 12/29/15.
//  Copyright © 2017年 An An. All rights reserved.
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
