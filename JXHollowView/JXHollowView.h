//
//  JXHollowView.h
//  JXViewDemo
//
//  Created by lxwyh on 2015/8/15.
//  Copyright © 2015年 LX. All rights reserved.
//

#import <UIKit/UIKit.h>

/** UIBezierPath 与 CALayer 应用： https://github.com/itwyhuaing/OC-WYH/tree/master/CALayer
 * 功能指引 ：采用镂空 + 透明图片 的方式展示
 * 其中镂空效果支持 ： 方形 or 圆形  ； 实线 or 虚线
 * 所需要的主要参数 ：镂空相对于 window 的坐标 ，透明图片相对于 window 的坐标 ， 图片名称
 * 注意 ： 因为蒙层铺满整个屏幕，所以传入的坐标需要是相对于 window 的坐标
 */



/**
 * 交互代理方法
 */
@class JXHollowView;
@protocol JXHollowViewDelegate <NSObject>
@optional
- (void)jx_hollowViewView:(JXHollowView *)v didTouchEvent:(UITouch *)touch;

@end

/**
 * 镂空部分形状样式 - 圆形 or 方形
 */
typedef enum : NSUInteger {
    CircleType = 100,
    SquareType,
} ShapeType;

/**
 * 镂空部分线条样式 - 实线 or 虚线
 */
typedef enum : NSUInteger {
    DashLineType = 200,
    SolidLineType,
} LineType;

@interface JXHollowView : UIView


/**
 附带坐标参数的实例化方法
 
 @param hRect 镂空坐标
 @param tRect 提示图片坐标
 @return 实例对象
 */
- (instancetype)initWithHollowRect:(CGRect)hRect tipRect:(CGRect)tRect;

@property (nonatomic,weak)      id<JXHollowViewDelegate>    delegate;
@property (nonatomic,assign)    ShapeType                   shapeType;          /**<允许实例化之后修改镂空形状>*/
@property (nonatomic,assign)    LineType                    lineType;           /**<允许实例化之后修改线条样式>*/
@property (nonatomic,copy)      NSString                    *tipImageName;      /**<允许实例化之后修改提示图片>*/
@property (nonatomic,assign)    CGRect                      hollowRect;         /**<允许实例化之后修改镂空坐标>*/
@property (nonatomic,assign)    CGRect                      tipRect;            /**<允许实例化之后修改提示图片坐标>*/

@end

