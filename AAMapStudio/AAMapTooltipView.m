//
//  AAMapTooltipView.m
//  Testing
//
//  Created by An An on 2017/8/24.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "AAMapTooltipView.h"

@implementation AAMapTooltipView{
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
        // 禁止将 AutoresizingMask 转换为 Constraints
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;//这句话看起来似乎挺重要的(没有还不行)
        [self addSubview:_titleLabel];
        
        [self addConstraints:@[[NSLayoutConstraint constraintWithItem:_titleLabel//被约束对象
                                                            attribute:NSLayoutAttributeLeft//被约束的值
                                                            relatedBy:NSLayoutRelationEqual//约束类型
                                                               toItem:self//约束依赖的对象
                                                            attribute:NSLayoutAttributeLeft//约束的值
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