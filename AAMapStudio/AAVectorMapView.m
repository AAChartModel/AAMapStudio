//
//  ChinaMapWithName.m
//  TestWebView
//
//  Created by apple on 17/1/5.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "AAVectorMapView.h"
//#import "YSCRippleView.h"
#import "AAMapTooltipView.h"
//#import "WorldContinentMap.h"
#import "AAMarkPointRippleView.h"

#import "AARippleView.h"

 /**
 *  固定宽高560*500
 */
#define AABackgroundColor        [UIColor colorWithRed:(rand()%256)/256.0 green:(rand()%256)/256.0 blue:(rand()%256)/256.0 alpha:1]
#define AADefaultBackgroundColor [UIColor colorWithRed: 0.667 green: 0.835 blue: 1 alpha: 1]

@interface AAVectorMapView (){
    NSMutableArray * _ripplePointArr;
}
@property (nonatomic, strong) NSMutableArray<UIBezierPath *> *bezierCurveArr;  //地图块贝塞尔曲线数组
@property (nonatomic, strong) NSMutableArray<UIColor      *> *areaColorArr;    //每块地图的颜色数组
@property (nonatomic, strong) NSMutableArray<NSDictionary *> *provinceNameArr; //各个省级行政区名字及位置数组

@property (nonatomic, strong) AAMarkPointRippleView *rippleView;
@property (nonatomic, assign) CGRect  textRect;
@property (nonatomic, strong) UITapGestureRecognizer *tapRecognizer;
@property (nonatomic, strong) AAMapTooltipView *toolTipView;

//@property (nonatomic, strong) WorldContinentMap *worldMap;

@end

@implementation AAVectorMapView

#pragma mark - init
- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:CGRectMake(0, 0, 560, 480)]) {
        self.backgroundColor = [UIColor whiteColor];
        
             //        [UIView animateWithDuration:1. animations:^{
        CGFloat scale = frame.size.width/560.;
        self.transform = CGAffineTransformMakeScale(scale, scale);//宽高伸缩比例
        self.center = CGPointMake(frame.size.width *0.5,frame.size.height *0.5);
        //        }];
//        self.worldMap = [[WorldContinentMap alloc]init];
//        self.worldMap.frame =CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
//        [self.worldMap drawCanvas1];
//        [self addSubview:self.worldMap];

        
//        //遍历34个地图块.判断点击的是那一块
//        for (int i = 0; i <34; i++) {
//       
//                self.areaColorArr[i]  = AABackgroundColor;
//                [self setNeedsDisplay];
//                
//            
//                
//         }
        
        
        _ripplePointArr = [[NSMutableArray alloc]init];

        
    }
    return self;
}



#pragma mark - render infographic
- (void)drawRect:(CGRect)rect {
    //画地图
    [self drawTheMapView];
    
    //画文字和涟漪动效视图
    [self drawTheTextAndRippleView];
   
    UIColor *color = [UIColor blueColor];
    [color set];

    for (int i=0; i<10; i++) {
        
        NSValue *rectValue=  self.provinceNameArr[arc4random()%34][@"rect"];
        CGRect rect =  [rectValue CGRectValue];
        [self configureTheDynamicLineWithStartPoin:CGPointMake(10, 70) toEndPoint:CGPointMake(rect.origin.x, rect.origin.y)];
        
        
    }
    
    [self performSelector:@selector(delayConfigureTheRippleView) withObject:nil/*可传任意类型参数*/ afterDelay:2.0];
}

//绘制地图主视图
- (void)drawTheMapView {
    
    UIColor* strokeColor = [UIColor colorWithRed: 0.976 green: 0.988 blue: 0.996 alpha: 1];
    
    [self.bezierCurveArr enumerateObjectsUsingBlock:^(UIBezierPath * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.miterLimit = 4;
        obj.lineJoinStyle = kCGLineJoinRound;
        [self.areaColorArr[idx] setFill];
        [obj fill];
        [strokeColor setStroke];
        obj.lineWidth = 1;
        [obj stroke];
    }];
}

- (void)drawTheTextAndRippleView {
    // 绘制文字
    __weak typeof(self) weakSelf = self;
    [self.provinceNameArr enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *name = obj[@"name"];
        NSValue *rectValue = obj[@"rect"];
        self.textRect = [rectValue CGRectValue];
        [weakSelf configureTextWithTextContentString:name rect:rectValue];
        
    }];
}


//绘制贝塞尔动态路径
- (void)configureTheDynamicLineWithStartPoin:(CGPoint)startPoint toEndPoint:(CGPoint)endPoint {
    [self drawLineWithStarPoint:startPoint endPoint:endPoint];
    [_ripplePointArr addObject:[NSValue valueWithCGPoint:endPoint]];
    
    

    
//    UILabel *redDotLabel = [[UILabel alloc]init];
//    redDotLabel.backgroundColor = [UIColor redColor];
//    redDotLabel.center = startPoint;
//    redDotLabel.layer.cornerRadius = 10;
//    redDotLabel.layer.masksToBounds = YES;
//    redDotLabel.bounds = CGRectMake(0, 0, 20, 20);
//    [self addSubview:redDotLabel];
  

    
    
//    [UIView animateWithDuration:2
//                          delay:0.5
//                        options:0
//                     animations:^{
//                         redDotLabel.center = endPoint;
//                         
//                     } completion:^(BOOL finished) {
//                         [UIView animateWithDuration:1
//                                          animations:^{
//                             redDotLabel.bounds = CGRectMake(0, 0, 0, 0);
//                             redDotLabel.alpha = 0;
//                         } completion:^(BOOL finished) {
//                             
//                             [self configureTheRippleViewWithPointPosition:endPoint];
//
//                             [redDotLabel removeFromSuperview];
//                             
//                         }];
//                         
//                     }];
    

    
    
}

- (void)delayConfigureTheRippleView {
    [_ripplePointArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
      CGPoint p = [obj CGPointValue];
      [self configureTheRippleViewWithPointPosition:p];
    }];


}

//绘制涟漪视图
- (void)configureTheRippleViewWithPointPosition:(CGPoint )point {
    CGFloat randomWidth = arc4random()%110+20;
//    self.rippleView = [[AAMarkPointRippleView alloc] init];
//    self.rippleView.center = CGPointMake(point.x, point.y);
//    self.rippleView.bounds = CGRectMake(0, 0, randomWidth, randomWidth);
//    self.rippleView.visionColor = [UIColor redColor];
//    [self addSubview:_rippleView];
//    
//    [_rippleView beginAnimation];
    
    
    AARippleView *rippleV = [[AARippleView alloc]init];
    rippleV.effectType = 2;
    rippleV.center = CGPointMake(point.x, point.y);
    rippleV.bounds = CGRectMake(0, 0, randomWidth, randomWidth);
    [self addSubview:rippleV];
    [rippleV startAnimation];
}

//绘制文字
- (void)configureTextWithTextContentString:(NSString *)name rect:(NSValue *)rect {
    CGRect  textRect = [rect CGRectValue];
    
    NSString *textContent = name;
    CGContextRef context = UIGraphicsGetCurrentContext();
    NSMutableParagraphStyle *textStyle = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
    textStyle.alignment = NSTextAlignmentLeft;
    
    NSDictionary *textFontAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize: 13],
                                         NSForegroundColorAttributeName:UIColor.blackColor,
                                         NSParagraphStyleAttributeName:textStyle
                                         };
    
    CGFloat textTextHeight = [textContent boundingRectWithSize:CGSizeMake(textRect.size.width, INFINITY)
                                                       options:NSStringDrawingUsesLineFragmentOrigin
                                                    attributes:textFontAttributes
                                                       context:nil].size.height;
    
    CGContextSaveGState(context);
    CGContextClipToRect(context, textRect);
    
    [textContent drawInRect:CGRectMake(CGRectGetMinX(textRect),
                                       CGRectGetMinY(textRect) + (CGRectGetHeight(textRect) - textTextHeight)/2,
                                       CGRectGetWidth(textRect),
                                       textTextHeight)
             withAttributes: textFontAttributes];
    
    CGContextRestoreGState(context);
}

#pragma mark -- setter
- (void)setTapEnabled:(BOOL)tapEnabled {
    if (_tapEnabled != tapEnabled) {
        _tapEnabled = tapEnabled;
        if (_tapEnabled == YES) {
            self.tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click:)];
            [self addGestureRecognizer:self.tapRecognizer];
        } else {
            if (_tapRecognizer) {
                [self removeGestureRecognizer:_tapRecognizer];
            }
        }
    }
}

#pragma mark -- event action
- (void)click:(UITapGestureRecognizer *)sender {
    CGPoint point = [sender locationInView:sender.view];
    [self didTapWithTheSelectedPointPosition:point];
}

- (void)didTapWithTheSelectedPointPosition:(CGPoint )point{
    
    [self configureTheTooltipViewWithPoinPosition:point];
    
    //遍历34个地图块.判断点击的是那一块
    for (int i = 0; i <34; i++) {
        UIBezierPath *path = self.bezierCurveArr[i];
        BOOL isInPath = [path containsPoint:point];
        if (isInPath) {
            //清除之前选中的颜色，fill当前选中的颜色
            self.areaColorArr[_selectedIdx]  = AADefaultBackgroundColor;
            _selectedIdx = i;
            self.areaColorArr[_selectedIdx]  = AABackgroundColor;
            [self setNeedsDisplay];//这一句代码比较关键
            
            [self respondingToTapEventsWithToBeSendDictionary:[NSMutableDictionary dictionaryWithDictionary:@{@"哈哈哈哈":@"很好成功地进行了传值"}]];
            
            
             CGFloat randomWidth = arc4random()%20+20;
            
            UIImageView *redPinImageV = [[UIImageView alloc]init];
            redPinImageV.image = [UIImage imageNamed:@"53c6470c59972"];
            redPinImageV.center = point;
            redPinImageV.bounds = CGRectMake(0, 0, randomWidth, randomWidth);
            redPinImageV.contentMode = UIViewContentModeScaleAspectFit;
            [self addSubview:redPinImageV];
            
        }
        }

}


- (void)configureTheTooltipViewWithPoinPosition:(CGPoint)point {
    
//    //点击生成连接线(随机链接五个点)
//    for (int i =0 ; i<5; i++) {
//      NSValue *rectValue=  self.provinceNameArr[arc4random()%34][@"rect"];
//         CGRect rect =  [rectValue CGRectValue];
//        [self configureTheDynamicLineWithStartPoin:point toEndPoint:CGPointMake(rect.origin.x, rect.origin.y)];
//    }
//    
//    for (int i=0; i<10; i++) {
//        
//        [self drawLineWithStarPoint:CGPointMake(10, 70) endPoint:CGPointMake(200, 80*i+50)];
//    }
    
    self.toolTipView.alpha = 0.6;
    self.toolTipView.titleText = self.provinceNameArr[arc4random()%34][@"name"];
    self.toolTipView.valueText = [NSString stringWithFormat:@"%u摄氏度",arc4random()%99999];
    
    
    // 弹簧动画，参数分别为：时长，延时，弹性（越小弹性越大），初始速度
    [UIView animateWithDuration:1.2
                          delay:0.1
         usingSpringWithDamping:0.6
          initialSpringVelocity:0.3
                        options:0
                     animations:^{
                         self.toolTipView.center = point;
                         
                     } completion:^(BOOL finished) {
                         
                         [UIView animateWithDuration:0.5
                                               delay:5
                                             options:0
                                          animations:^{
                                              self.toolTipView.alpha = 0;
                                          } completion:nil];
                     }];
    
}

//相应点击事件后传值(delegate 传值或 block 传值)
- (void)respondingToTapEventsWithToBeSendDictionary:(NSMutableDictionary *)dic {
    if (self.didTapBlock) {
        self.didTapBlock(dic);
    } else {
        [self.didTapDelegate aaMapViewDidTapWithTappedElementDictionary:dic];
    }
}

//以动画的形式画线
- (void)drawLineWithStarPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint {
    // 创建path
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:startPoint];
    [path addLineToPoint:endPoint];
    
    CAShapeLayer *trackLayer = [CAShapeLayer new];
    trackLayer.path = path.CGPath;
    trackLayer.frame = self.bounds;
    trackLayer.lineWidth = 1;
    trackLayer.fillColor = nil;
    trackLayer.strokeColor = [UIColor blackColor].CGColor;
    
    [self.layer addSublayer:trackLayer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:NSStringFromSelector(@selector(strokeEnd))];
    animation.fromValue = @0.0;
    animation.toValue = @1.0;
    animation.duration = 2;
    
    [trackLayer addAnimation:animation forKey:NSStringFromSelector(@selector(strokeEnd))];
}


//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    _areaColorArr = nil;
//    [self setNeedsDisplay];
//}

#pragma mark -- lazy load
- (NSMutableArray<UIBezierPath *> *)bezierCurveArr {
    if (_bezierCurveArr == nil) {
        NSString *sourcePath = [[NSBundle mainBundle] pathForResource:@"AAChinaMapPaths" ofType:@"plist"];
        NSData *pathsData = [NSData dataWithContentsOfFile:sourcePath];
        _bezierCurveArr = [NSKeyedUnarchiver unarchiveObjectWithData:pathsData];
        
    }
    return _bezierCurveArr;
}

- (NSMutableArray *)areaColorArr {
    if (_areaColorArr == nil) {
        _areaColorArr = [NSMutableArray arrayWithCapacity:34];
        for (int i = 0; i < 34; i++) {
            UIColor *fillColor = AADefaultBackgroundColor;
            [_areaColorArr addObject:fillColor];
        }
    }
    return _areaColorArr;
}

- (NSMutableArray *)provinceNameArr {
    if (_provinceNameArr != nil) {
        return _provinceNameArr;
    }
    return [self readFromDisk];
}

- (NSMutableArray *)readFromDisk {
    NSString *sourcePath = [[NSBundle mainBundle] pathForResource:@"AAProvinceName" ofType:@"plist"];
    NSData *data = [NSData dataWithContentsOfFile:sourcePath];
    NSMutableArray *nameArr = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return nameArr;
}

- (AAMapTooltipView *)toolTipView {
    if (!_toolTipView) {
        _toolTipView = [[AAMapTooltipView alloc]init];
//        _toolTipView.shadow = YES;
        [self addSubview:_toolTipView];
    }
    return _toolTipView;
}

@end




 
