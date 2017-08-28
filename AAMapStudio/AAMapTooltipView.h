//
//  AAMapTooltipView.h
//  Testing
//
//  Created by An An on 2017/8/24.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AAMapTooltipView : UIView


/**
 标题文本内容
 */
@property (nonatomic, copy) NSString *titleText;

/**
 值文本内容
 */
@property (nonatomic, copy) NSString *valueText;

/**************************借用 highchart 的 tooltip 属性列表*************************/

/**
 是否启用动画效果
 */
@property (nonatomic, assign) BOOL *animation;

/**
 边框颜色
 */
@property (nonatomic, strong) UIColor *borderColor;

/**
 圆角半径
 */
@property (nonatomic, assign) CGFloat borderRadius;

/**
 边框宽度
 */
@property (nonatomic, assign) CGFloat borderWidth;

/**
 是否跟随手指移动
 */
@property (nonatomic, assign) BOOL followTouchMove;


/**
 浮动提示框隐藏延时时间
 */
@property (nonatomic, assign) CGFloat hideDelay;


/**
 是否开启阴影效果
 */
@property (nonatomic, assign) BOOL shadow;

/**************************借用 highchart 的 tooltip 属性列表*************************/

@property (nonatomic, assign) UIEdgeInsets titleLabelPadding;

@property (nonatomic, assign) UIEdgeInsets valueLabelPadding;
@end
