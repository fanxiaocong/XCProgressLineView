//
//  XCProgressLineView.h
//
//
//  Created by 樊小聪 on 16/5/18.
//  Copyright © 2016年 樊小聪 All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface XCProgressLineView : UIView

/** 👀 背景颜色（默认为 亮灰色） 👀 */
@property (weak, nonatomic) IBInspectable UIColor *bgColor;

/** 👀 填充颜色(默认为 橙色) 👀 */
@property (weak, nonatomic) IBInspectable UIColor *strokeColor;

/** 👀 进度（0~1，默认为 1） 👀 */
@property (assign, nonatomic) IBInspectable CGFloat progress;

/** 👀 动画时间(默认为 1s) 👀 */
@property (assign, nonatomic) IBInspectable NSTimeInterval animationDuration;


@end
