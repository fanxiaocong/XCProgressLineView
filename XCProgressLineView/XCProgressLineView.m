//
//  XCProgressLineView.m
//
//
//  Created by 樊小聪 on 16/5/18.
//  Copyright © 2016年 樊小聪 All rights reserved.
//

#import "XCProgressLineView.h"


#define SELF_WIDTH      self.bounds.size.width

#define SELF_HEIGHT     self.bounds.size.height


@interface XCProgressLineView ()

@property (strong, nonatomic) CAShapeLayer *backgroundLayer;

@property (strong, nonatomic) CAShapeLayer *strokeLayer;

@property (strong, nonatomic) UIBezierPath *bezierPath;

@end

@implementation XCProgressLineView

#pragma mark - ⏳ 👀 LifeCycle Method 👀

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        // 设置默认参数
        [self setUpDefaults];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        // 设置默认参数
        [self setUpDefaults];
    }
    
    return self;
}

// 设置默认参数
- (void)setUpDefaults
{
    _progress          = 1.f;
    _bgColor           = [UIColor lightGrayColor];
    _strokeColor       = [UIColor orangeColor];
    _animationDuration = 1.f;
    
    _bezierPath = [UIBezierPath bezierPath];
    [_bezierPath moveToPoint:CGPointMake(SELF_HEIGHT * 0.5, SELF_HEIGHT * 0.5)];
    [_bezierPath addLineToPoint:CGPointMake(SELF_WIDTH - SELF_HEIGHT * 0.5, SELF_HEIGHT * 0.5)];
    
    [self backgroundLayer];
    [self strokeLayer];
}

#pragma mark - 💤 👀 LazyLoad Method 👀

- (CAShapeLayer *)backgroundLayer
{
    if (!_backgroundLayer)
    {
        CAShapeLayer *backgroundLayer = [CAShapeLayer layer];
        backgroundLayer.lineWidth   = SELF_HEIGHT;
        backgroundLayer.strokeColor = self.bgColor.CGColor;
        backgroundLayer.lineCap     = kCALineCapRound;
        backgroundLayer.strokeEnd   = 1;
        backgroundLayer.path        = self.bezierPath.CGPath;
        
        _backgroundLayer = backgroundLayer;
        [self.layer addSublayer:backgroundLayer];
    }
    
    return _backgroundLayer;
}

- (CAShapeLayer *)strokeLayer
{
    if (!_strokeLayer)
    {
        CAShapeLayer *strokeLayer = [CAShapeLayer layer];
        strokeLayer.lineWidth   = SELF_HEIGHT;
        strokeLayer.fillColor   = [UIColor clearColor].CGColor;
        strokeLayer.strokeColor = self.strokeColor.CGColor;
        strokeLayer.lineCap     = kCALineCapRound;
        strokeLayer.path        = self.bezierPath.CGPath;
        
        _strokeLayer = strokeLayer;
        [self.layer addSublayer:strokeLayer];
    }
    
    return _strokeLayer;
}

#pragma mark - 👀 Setter Method 👀 💤

- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    
    [self startAnimation];
}

#pragma mark - 🔒 👀 Privite Method 👀

- (void)startAnimation
{
    self.strokeLayer.strokeEnd   = self.progress;
    
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    anim.duration            = self.animationDuration;
    anim.fillMode            = kCAFillModeForwards;
    anim.removedOnCompletion = NO;
    anim.fromValue           = @0;
    anim.toValue             = @(self.progress);
    
    [self.strokeLayer addAnimation:anim forKey:NULL];
}

@end



















