//
//  CoolSegmentBar.h
//  CoolSegmentBar
//
//  Created by ian on 2018/4/2.
//  Copyright © 2018年 Rengfou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoolSegmentBar : UIView

/**
 选择的回调
 */
@property (nonatomic, copy) void(^segmentButtonClick)(NSInteger index);

/**
 初始化方法

 @param frame 自身的frame
 @param items 各个item标题
 @param itemSelectedIndex 默认选择的位置
 @param font 普通字体
 @param selectedFont 选择的字体
 @param textColor 普通字体颜色
 @param selectedTextColor 选择的字体颜色
 @param lineViewColor 线的颜色
 @param animateLineViewColor 移动模块线的颜色
 @return 实例
 */
- (instancetype)initWithFrame:(CGRect)frame items:(NSArray *)items itemSelectedIndex:(NSUInteger)itemSelectedIndex font:(UIFont *)font selectedFont:(UIFont *)selectedFont textColor:(UIColor *)textColor selectedTextColor:(UIColor *)selectedTextColor lineViewColor:(UIColor *)lineViewColor animateLineViewColor:(UIColor *)animateLineViewColor;

/**
 设置选择的按钮

 @param index 选择的按钮的索引值
 */
- (void)refreshSegmentButton:(NSUInteger)index;

@end
