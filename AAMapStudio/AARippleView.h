//
//  AARipple.h
//  AARipple
//
//  Created by An An on 2017/8/24.
//  Copyright © 2017年 An An. All rights reserved.
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
