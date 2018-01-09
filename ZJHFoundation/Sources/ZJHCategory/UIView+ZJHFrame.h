//
//  UIView+ZJHFrame.h
//  ZJHFoundation
//
//  Created by 曾俊晖 on 2018/1/9.
//  Copyright © 2018年 ZJH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZJHFrame)
///X
@property (nonatomic, assign) CGFloat zjh_x;
///Y
@property (nonatomic, assign) CGFloat zjh_y;
///height
@property (nonatomic, assign) CGFloat zjh_height;
///width
@property (nonatomic, assign) CGFloat zjh_width;
///centerX
@property (nonatomic, assign) CGFloat zjh_centerX;
///centerY
@property (nonatomic, assign) CGFloat zjh_centerY;
///Origin
@property (nonatomic, assign) CGPoint zjh_origin;
///size
@property (nonatomic, assign) CGSize zjh_size;

@end
