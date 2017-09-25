//
//  AARippleView.m
//  AARippleView
//
//  Created by An An on 2017/8/24.
//  Copyright © 2017年 An An. All rights reserved.
//  source code ----*** https://github.com/AAChartModel/AAMapStudio ***--- source code
//

#import "AARippleView.h"

@interface AARippleView()

@property (nonatomic, strong) CAGradientLayer *gradientLayer;
@property (nonatomic, strong) CAReplicatorLayer *replicatorLayer;
@property (nonatomic, strong) CAShapeLayer *circleLayer;


//gradient layer property
@property (nonatomic, copy  ) NSArray *colors;
@property (nonatomic, copy  ) NSArray *locations;
@property (nonatomic, assign) CGPoint startPoint;
@property (nonatomic, assign) CGPoint endPoint;

//replicator layer property
@property (nonatomic, assign) NSUInteger count;
@property (nonatomic, assign) CGFloat duration;

//circle layer property
@property (nonatomic, assign) CGFloat minRadius;
@property (nonatomic, assign) CGFloat maxRadius;
@property (nonatomic, assign) CGFloat lineWidth;

//animation property
@property (nonatomic, strong) CAMediaTimingFunction *timingFunction;


@end

@implementation AARippleView


- (instancetype)init {
    self = [super init];
    if (self) {
        self.gradientLayer = ({
            CAGradientLayer *layer = [CAGradientLayer new];
            [self.layer addSublayer:layer];
            layer;
        });
        
        self.replicatorLayer = ({
            CAReplicatorLayer *layer = [CAReplicatorLayer new];
            self.gradientLayer.mask = layer;
            layer;
        });
        
        self.circleLayer = ({
            CAShapeLayer *layer = [CAShapeLayer new];
            layer.strokeColor = [UIColor whiteColor].CGColor;
            layer.fillColor = [UIColor clearColor].CGColor;
            [self.replicatorLayer addSublayer:layer];
            layer;
        });
        
        self.minRadius = 10;
        self.maxRadius = 100;
        self.duration = 3.0f;
        self.count = 6;
        self.lineWidth = 2.0f;
        self.colors = @[(__bridge id)[UIColor orangeColor].CGColor,
                        (__bridge id)[UIColor orangeColor].CGColor];
        self.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    }
    
    return self;
}

- (void)setColors:(NSArray *)colors {
    self.gradientLayer.colors = colors;
}

- (NSArray *)colors {
    return self.gradientLayer.colors;
}

- (void)setLocations:(NSArray<NSNumber *> *)locations {
    self.gradientLayer.locations = locations;
}

- (NSArray *)locations {
    return self.gradientLayer.locations;
}

- (void)setStartPoint:(CGPoint)startPoint {
    self.gradientLayer.startPoint = startPoint;
}

- (CGPoint)startPoint {
    return self.gradientLayer.startPoint;
}

- (void)setEndPoint:(CGPoint)endPoint {
    self.gradientLayer.endPoint = endPoint;
}

- (CGPoint)endPoint {
    return self.gradientLayer.endPoint;
}

- (void)setDuration:(CGFloat)duration {
    _duration = duration;
    
    if (_count != 0) {
        self.replicatorLayer.instanceCount = _count;
        self.replicatorLayer.instanceDelay = self.duration/(CGFloat)_count;
    }
}

- (void)setCount:(NSUInteger)count {
    _count = count;
    
    if (_count != 0) {
        self.replicatorLayer.instanceCount = _count;
        self.replicatorLayer.instanceDelay = self.duration/(CGFloat)_count;
    }
}

- (void)setLineWidth:(CGFloat)lineWidth {
    _lineWidth = lineWidth;
    
    self.circleLayer.lineWidth = lineWidth;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.gradientLayer.frame = self.bounds;
    self.replicatorLayer.frame = self.bounds;
    self.circleLayer.frame = self.bounds;
}

- (void)startAnimation {
    if (self.effectType == 1) {
        [self launchRippleEffect];
    } else {
        CGRect fromRect = CGRectMake(CGRectGetMidX(self.bounds)-self.minRadius,
                                     CGRectGetMidY(self.bounds)-self.minRadius,
                                     self.minRadius*2,
                                     self.minRadius*2);
        CGRect toRect = CGRectMake(CGRectGetMidX(self.bounds)-self.maxRadius,
                                   CGRectGetMidY(self.bounds)-self.maxRadius,
                                   self.maxRadius*2,
                                   self.maxRadius*2);
        
        CABasicAnimation *zoomAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
        zoomAnimation.duration = self.duration;
        zoomAnimation.fromValue = (__bridge id)[UIBezierPath bezierPathWithOvalInRect:fromRect].CGPath;
        zoomAnimation.toValue = (__bridge id)[UIBezierPath bezierPathWithOvalInRect:toRect].CGPath;
        zoomAnimation.repeatCount = HUGE_VAL;
        zoomAnimation.timingFunction = self.timingFunction;
        [self.circleLayer addAnimation:zoomAnimation forKey:@"zoom"];
        
        CABasicAnimation *fadeAnimation = [CABasicAnimation animationWithKeyPath:@"strokeColor"];
        fadeAnimation.duration = self.duration;
        fadeAnimation.fromValue = (__bridge id)[UIColor whiteColor].CGColor;
        fadeAnimation.toValue = (__bridge id)[UIColor clearColor].CGColor;
        fadeAnimation.repeatCount = HUGE_VAL;
        fadeAnimation.timingFunction = self.timingFunction;
        [self.circleLayer addAnimation:fadeAnimation forKey:@"fade"];
    }
}

- (void)stopAnimation {
    [self.circleLayer removeAllAnimations];
}

- (void)setEffectType:(AARippleEffect)effectType {
    switch (effectType) {
        case 0: {
            self.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
            self.colors = @[(__bridge id)[UIColor blueColor].CGColor,
                            (__bridge id)[UIColor blueColor].CGColor];
            self.minRadius = 0;
            self.maxRadius = 80;
            self.duration = 5;
            self.count = 20;
            self.lineWidth = 1.0f;
            
            break;
        }
        case 1: {
            self.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            self.colors = @[(__bridge id)[UIColor colorWithRed:0.996 green:0.647 blue:0.008 alpha:1].CGColor,
                            (__bridge id)[UIColor colorWithRed:1 green:0.31 blue:0.349 alpha:1].CGColor];
            
            CGRect screenRect = [UIScreen mainScreen].bounds;
            CGFloat posY = (CGRectGetHeight(screenRect)-320)/2/CGRectGetHeight(screenRect);
            
            self.startPoint = CGPointMake(0.5, posY);
            self.endPoint = CGPointMake(0.5, 1.0f - posY);
            self.minRadius = 40;
            self.maxRadius = 100;
            self.duration = 2;
            self.count = 4;
            self.lineWidth = 2.0f;
            
//            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//            btn.backgroundColor = [UIColor blueColor];
//            [btn setBackgroundImage:[UIImage imageNamed:@"button"] forState:UIControlStateNormal];
//            [btn setTitle:@"Tap" forState:UIControlStateNormal];
//            btn.frame = CGRectMake(0, 0, 100, 100);
//            btn.center = self.center;
//            [btn addTarget:self action:@selector(launchRippleEffect) forControlEvents:UIControlEventTouchUpInside];
//            [self addSubview:btn];
            
            break;
        }
        case 2: {
            self.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
            self.colors = @[(__bridge id)[UIColor redColor].CGColor,
                            (__bridge id)[UIColor blueColor].CGColor];
            self.startPoint = CGPointMake(0, 0.5);
            self.endPoint = CGPointMake(1, 0.5);
            self.minRadius = 0;
            self.maxRadius = 60;
            self.duration = 5;
            self.count = 1;
            self.lineWidth = 5.0f;
            
            break;
        }
        case 3: {
            self.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            self.colors = @[(__bridge id)[UIColor whiteColor].CGColor,
                            (__bridge id)[UIColor blackColor].CGColor,
                            (__bridge id)[UIColor whiteColor].CGColor];
            self.locations = @[@(0.3),@(0.5),@(0.7)];
            self.startPoint = CGPointMake(0, 0.5);
            self.endPoint = CGPointMake(1, 0.5);
            self.minRadius = 0;
            self.maxRadius = 100;
            self.duration = 3;
            self.count = 6;
            self.lineWidth = 3.0f;
            
            break;
        }
            
        default:
            break;
    }
}

- (void)launchRippleEffect {
    
    NSInteger maxI = 2;
    NSInteger maxJ = 2;
    NSMutableArray *pulseArray = @[].mutableCopy;
    for (int i = 0; i < maxI*maxJ ; ++i){
        [pulseArray addObject:[AARippleView new]];
    }
    
    AARippleView *pulseView = pulseArray[1];
    pulseView.tag = 1 - pulseView.tag;
    (pulseView.tag>0)?[pulseView startAnimation]:[pulseView stopAnimation];
}

@end
