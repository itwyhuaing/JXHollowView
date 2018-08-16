//
//  JXHollowView.h
//  JXViewDemo
//
//  Created by lxwyh on 2015/8/15.
//  Copyright © 2015年 LX. All rights reserved.
//

#import "JXHollowView.h"


@interface JXHollowView ()

@property (nonatomic,strong) UIImageView *tipImageView;

@end

@implementation JXHollowView

#pragma mark ------ init

- (instancetype)initWithHollowRect:(CGRect)hRect tipRect:(CGRect)tRect
{
    self = [super init];
    if (self) {
        
        _hollowRect = hRect;
        _tipRect = tRect;
        _tipImageView = [[UIImageView alloc] initWithFrame:_tipRect];
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6f];
        [self setFrame:[UIScreen mainScreen].bounds];
        [self addSubview:_tipImageView];
        
    }
    return self;
}

#pragma mark ------ updateUI

- (void)updateUI{
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRect:[UIScreen mainScreen].bounds];
    if (_shapeType == SquareType) {
        
        [bezierPath appendPath:[[UIBezierPath bezierPathWithRoundedRect:_hollowRect cornerRadius:0] bezierPathByReversingPath]];
        
    } else {
        
        [bezierPath appendPath:[UIBezierPath bezierPathWithArcCenter:CGPointMake(_hollowRect.origin.x+_hollowRect.size.width/2.f, _hollowRect.origin.y+_hollowRect.size.height/2.f)
                                                              radius:_hollowRect.size.height/2.f
                                                          startAngle:0
                                                            endAngle:2*M_PI
                                                           clockwise:NO]];
        
    }
    
    if (_lineType == DashLineType) {
        
        [shapeLayer setLineWidth:2.f];
        [shapeLayer setLineJoin:kCALineJoinRound];
        [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:6],[NSNumber numberWithInt:6], nil]];
        
    }
    shapeLayer.path = bezierPath.CGPath;
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    self.layer.mask = shapeLayer;
    
}

#pragma mark ------ 参数修改

- (void)setTipImageName:(NSString *)tipImageName{
    
    if (![_tipImageName isEqualToString:tipImageName]) {
        _tipImageName = tipImageName;
        [_tipImageView setImage:[UIImage imageNamed:_tipImageName]];
    }
    
}

-(void)setHollowRect:(CGRect)hollowRect{
    
    if (!CGRectEqualToRect(_hollowRect, hollowRect)) {
        _hollowRect = hollowRect;
        [self updateUI];
    }
    
}

- (void)setTipRect:(CGRect)tipRect{
    
    if (!CGRectEqualToRect(_tipRect, tipRect)) {
        _tipRect = tipRect;
        [_tipImageView setFrame:_tipRect];
    }
    
}

-(void)setShapeType:(ShapeType)shapeType{
    
    _shapeType = shapeType;
    [self updateUI];
    
}

- (void)setLineType:(LineType)lineType{
    
    _lineType = lineType;
    [self updateUI];
    
}

#pragma mark ------ 点击事件

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSArray *ts = [touches allObjects];
    UITouch *t = [ts firstObject];
    if (_delegate && [_delegate respondsToSelector:@selector(jx_hollowViewView:didTouchEvent:)]) {        
        [_delegate jx_hollowViewView:self didTouchEvent:t];
        
    }
    
}

@end

