//
//  ViewController.m
//  JXViewDemo
//
//  Created by hnbwyh on 2018/8/15.
//  Copyright © 2018年 JiXia. All rights reserved.
//

#import "ViewController.h"
#import "JXHollowView.h"

@interface ViewController ()<JXHollowViewDelegate>
@property (nonatomic,strong) UIButton       *btn1;
@property (nonatomic,strong) UIButton       *btn2;
@property (nonatomic,strong) UIButton       *btn3;
@property (nonatomic,strong) UIButton       *btn4;
@property (nonatomic,strong) JXHollowView   *tipView;

@property (nonatomic,assign) NSInteger      count;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"点击屏幕任意空白处";
    
    CGSize sc = [UIScreen mainScreen].bounds.size;
    CGFloat w = 50.0;
    CGFloat gap = (sc.width - w * 2.0) / 3.0;
    
    CGRect rect = CGRectZero;
    rect.size = CGSizeMake(50, 50);
    rect.origin.x = gap;
    
    rect.origin.y = 100;
    _btn1 = [self createButtonWith:rect title:@"圆-实线"];
    _btn1.layer.cornerRadius = rect.size.height / 2.f;
    [self.view addSubview:_btn1];
    
    rect.origin.x = CGRectGetMaxX(_btn1.frame) + gap;
    _btn2 = [self createButtonWith:rect title:@"圆-虚线"];
    _btn2.layer.cornerRadius = rect.size.height / 2.f;
    [self.view addSubview:_btn2];
    
    rect.origin.x = gap;
    rect.origin.y += 160;
    _btn3 = [self createButtonWith:rect title:@"方-实线"];
    [self.view addSubview:_btn3];
    
    rect.origin.x = CGRectGetMaxX(_btn3.frame) + gap;
    _btn4 = [self createButtonWith:rect title:@"方-虚线"];
    [self.view addSubview:_btn4];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = FALSE;
    
}


- (UIButton *)createButtonWith:(CGRect)rect title:(NSString *)title{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:10.f]];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //btn.layer.borderWidth = 1.f;
    btn.layer.borderColor = [UIColor blackColor].CGColor;
    [btn setFrame:rect];
    [btn setBackgroundColor:[UIColor greenColor]];
    return btn;
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    CGRect btnRect1 = _btn1.frame;
    btnRect1.origin.x -= 1.5;
    btnRect1.origin.y -= 1.5;
    //btnRect1.origin.y -= 64;
    btnRect1.size.width += 3.f;
    btnRect1.size.height += 3.f;
    CGRect imgRect1 = CGRectMake(CGRectGetMidX(btnRect1) - 319.f/5.f,CGRectGetMinY(btnRect1)-273.f/5.f, 319.f/5.f, 273.f/5.f);
    
    _tipView = [[JXHollowView alloc] initWithHollowRect:[self convertIntoWindowWithRect:btnRect1] tipRect:[self convertIntoWindowWithRect:imgRect1]];
    _tipView.delegate = self;
    _tipView.tipImageName = @"tipImage";
    _tipView.shapeType = CircleType;
    _tipView.lineType = SolidLineType;
    [[UIApplication sharedApplication].keyWindow addSubview:_tipView];
    //[self.view addSubview:_tipView];
    
    _count = 1;
    
}

#pragma mark ------ RWGuidanceViewDelegate
- (void)jx_hollowViewView:(JXHollowView *)v didTouchEvent:(UITouch *)touch{
    
    _count ++;
    
    switch (_count) {
        case 2:
        {
            CGRect btnRect2 = _btn2.frame;
            btnRect2.origin.x -= 1.5;
            btnRect2.origin.y -= 1.5;
            btnRect2.size.width += 3.f;
            btnRect2.size.height += 3.f;
            CGRect imgRect2 = CGRectMake(CGRectGetMidX(btnRect2) - 319.f/5.f, CGRectGetMinY(btnRect2)-273.f/5.f, 319.f/5.f, 273.f/5.f);
            _tipView.hollowRect = [self convertIntoWindowWithRect:btnRect2];
            _tipView.tipRect = [self convertIntoWindowWithRect:imgRect2];
            _tipView.tipImageName = @"tipImage";
            _tipView.shapeType = CircleType;
            _tipView.lineType = DashLineType;
        }
            break;
        case 3:
        {
            CGRect btnRect3 = _btn3.frame;
            btnRect3.origin.x -= 1.5;
            btnRect3.origin.y -= 1.5;
            btnRect3.size.width += 3.f;
            btnRect3.size.height += 3.f;
            CGRect imgRect3 = CGRectMake(CGRectGetMidX(btnRect3) - 319.f/5.f, CGRectGetMinY(btnRect3)-273.f/5.f, 319.f/5.f, 273.f/5.f);
            _tipView.hollowRect = [self convertIntoWindowWithRect:btnRect3];
            _tipView.tipRect = [self convertIntoWindowWithRect:imgRect3];
            _tipView.tipImageName = @"tipImage";
            _tipView.shapeType = SquareType;
            _tipView.lineType = SolidLineType;
        }
            break;
        case 4:
        {
            CGRect btnRect4 = _btn4.frame;
            btnRect4.origin.x -= 1.5;
            btnRect4.origin.y -= 1.5;
            btnRect4.size.width += 3.f;
            btnRect4.size.height += 3.f;
            CGRect imgRect4 = CGRectMake(CGRectGetMidX(btnRect4) - 319.f/5.f, CGRectGetMinY(btnRect4)-273.f/5.f, 319.f/5.f, 273.f/5.f);
            _tipView.hollowRect = [self convertIntoWindowWithRect:btnRect4];
            _tipView.tipRect = [self convertIntoWindowWithRect:imgRect4];
            _tipView.tipImageName = @"tipImage";
            _tipView.shapeType = SquareType;
            _tipView.lineType = DashLineType;
        }
            break;
            
        default:
        {
            [_tipView removeFromSuperview];
        }
            break;
    }
    
}

#pragma mark ------ 坐标变化

- (CGRect)convertIntoWindowWithRect:(CGRect)rect{
    
    return [self.view convertRect:rect toView:nil];
    
}


@end
