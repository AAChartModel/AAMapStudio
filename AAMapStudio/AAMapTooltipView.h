//
//  AAMapTooltipView.h
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
