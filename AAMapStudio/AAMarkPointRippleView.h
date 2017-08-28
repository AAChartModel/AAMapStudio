//
//  AAMarkPointRippleView.h
//  Testing
//
//  Created by An An on 2017/8/28.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AAMarkPointRippleView : UIView
@property (nonatomic, strong) UIColor *visionColor;//视觉色彩
@property (nonatomic, assign) NSUInteger instanceDelay;//复制时间间隔
@property (nonatomic, assign) NSUInteger instanceCount;//复制图层个数


- (void)beginAnimation;

- (void)stopAnimation;

@end
