//
//  AAMapTooltipView.m
//  AAMapStudioDemo
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

#import "AAMapTooltipView.h"

@implementation AAMapTooltipView {
    UILabel *_titleLabel;
    UILabel *_valueLabel;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        
        self.bounds = CGRectMake(0, 0, 100, 61.8);
        self.layer.cornerRadius = 3;
        self.layer.masksToBounds = YES;
        self.alpha = 0.6;
        self.backgroundColor = [UIColor blackColor];
        
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont systemFontOfSize:15.f];
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_titleLabel];
        
        [self addConstraints:@[[NSLayoutConstraint constraintWithItem:_titleLabel
                                                            attribute:NSLayoutAttributeLeft
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self
                                                            attribute:NSLayoutAttributeLeft
                                                           multiplier:1.0
                                                             constant:10],
                               [NSLayoutConstraint constraintWithItem:_titleLabel
                                                            attribute:NSLayoutAttributeRight
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self
                                                            attribute:NSLayoutAttributeRight
                                                           multiplier:1.0
                                                             constant:-10],
                               [NSLayoutConstraint constraintWithItem:_titleLabel
                                                            attribute:NSLayoutAttributeTop
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self
                                                            attribute:NSLayoutAttributeTop
                                                           multiplier:1.0
                                                             constant:10]]];
        
        
        
        _valueLabel = [[UILabel alloc]init];
        _valueLabel.textColor = [UIColor whiteColor];
        _valueLabel.font = [UIFont systemFontOfSize:12.f];
        _valueLabel.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self addSubview:_valueLabel];
        
        [self addConstraints:@[[NSLayoutConstraint constraintWithItem:_valueLabel
                                                            attribute:NSLayoutAttributeLeft
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self
                                                            attribute:NSLayoutAttributeLeft
                                                           multiplier:1.0
                                                             constant:10],
                               [NSLayoutConstraint constraintWithItem:_valueLabel
                                                            attribute:NSLayoutAttributeRight
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self
                                                            attribute:NSLayoutAttributeRight
                                                           multiplier:1.0
                                                             constant:-10],
                               [NSLayoutConstraint constraintWithItem:_valueLabel
                                                            attribute:NSLayoutAttributeTop
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:_titleLabel
                                                            attribute:NSLayoutAttributeBottom
                                                           multiplier:1.0
                                                             constant:10]]];
        
        
    }
    return self;
}

#pragma mark -- setter method
- (void)setTitleText:(NSString *)titleText {
    _titleLabel.text = titleText;
}

- (void)setValueText:(NSString *)valueText {
    _valueLabel.text = valueText;
}

- (void)setBorderColor:(UIColor *)borderColor {
    self.layer.borderColor = borderColor.CGColor;
}

- (void)setBorderRadius:(CGFloat)borderRadius {
    self.layer.cornerRadius = borderRadius;
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    self.layer.borderWidth = borderWidth;
}

- (void)setShadow:(BOOL)shadow {
    _shadow = shadow;
    if (_shadow == YES) {
        self.layer.shadowOpacity = 0.5;// 阴影透明度
        self.layer.shadowColor = [UIColor grayColor].CGColor;// 阴影的颜色
        self.layer.shadowRadius = 3;// 阴影扩散的范围控制
        self.layer.shadowOffset = CGSizeMake(1, 1);// 阴影的范围
    }
}


- (void)setTitleLabelPadding:(UIEdgeInsets)titleLabelPadding {
    _titleLabelPadding = titleLabelPadding;
    
}

- (void)setValueLabelPadding:(UIEdgeInsets)valueLabelPadding {
    _valueLabelPadding = valueLabelPadding;
}


@end
