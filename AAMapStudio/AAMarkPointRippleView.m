//
//  AAMarkPointRippleView.m
//  Testing
//
//  Created by An An on 2017/8/28.
//  Copyright © 2017年 An An. All rights reserved.
//  source code ----*** https://github.com/AAChartModel/AAMapStudio ***--- source code
//

#import "AAMarkPointRippleView.h"
@interface AAMarkPointRippleView ()

@property (nonatomic, strong) CAShapeLayer *circleShapeLayer;

@end

@implementation AAMarkPointRippleView

- (instancetype)init {
    self = [super init];
    if (self) {
        
        self.instanceDelay = 1;
        self.instanceCount = 6;
    }
    return self;
}

- (void)beginAnimation {
    [self configureLayers];
    //    [self performSelector:@selector(delayMethod) withObject:nil/*可传任意类型参数*/ afterDelay:2.0];
    [self delayMethod];
}

- (void)configureLayers {
    CGFloat width = self.bounds.size.width;
    
    self.circleShapeLayer = [CAShapeLayer layer];
    _circleShapeLayer.bounds = CGRectMake(0, 0, width, width);
    _circleShapeLayer.position = CGPointMake(width / 2.0, width / 2.0);
    _circleShapeLayer.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, width, width)].CGPath;
    _circleShapeLayer.fillColor = self.visionColor.CGColor;
    _circleShapeLayer.opacity = 0.0;
    
    CAReplicatorLayer *replicator = [CAReplicatorLayer layer];
    replicator.bounds = CGRectMake(0, 0, width, width);
    replicator.position = CGPointMake(width / 2.0, width / 2.0);
    replicator.instanceDelay = self.instanceDelay;//复制时间间隔
    replicator.instanceCount = self.instanceCount;;//复制图层个数
    
    [replicator addSublayer:_circleShapeLayer];
    [self.layer addSublayer:replicator];
}

- (void)delayMethod {
    CABasicAnimation *alphaAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    alphaAnimation.fromValue = [NSNumber numberWithFloat:0.6];
    alphaAnimation.toValue = [NSNumber numberWithFloat:0.0];
    
    CABasicAnimation *scaleAnimation =[CABasicAnimation animationWithKeyPath:@"transform"];
    CATransform3D t = CATransform3DIdentity;
    CATransform3D t2 = CATransform3DScale(t, 0.0, 0.0, 0.0);
    scaleAnimation.fromValue = [NSValue valueWithCATransform3D:t2];
    CATransform3D t3 = CATransform3DScale(t, 1.0, 1.0, 0.0);
    scaleAnimation.toValue = [NSValue valueWithCATransform3D:t3];
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[alphaAnimation, scaleAnimation];
    animationGroup.duration = 4.0;
    animationGroup.autoreverses = NO;
    animationGroup.repeatCount = HUGE;
    
    [_circleShapeLayer addAnimation:animationGroup forKey:nil];
}

- (void)stopAnimation {
    [_circleShapeLayer removeAllAnimations];
}


@end
