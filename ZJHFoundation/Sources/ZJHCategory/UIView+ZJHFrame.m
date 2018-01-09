//
//  UIView+ZJHFrame.m
//  ZJHFoundation
//
//  Created by 曾俊晖 on 2018/1/9.
//  Copyright © 2018年 ZJH. All rights reserved.
//

#import "UIView+ZJHFrame.h"

@implementation UIView (ZJHFrame)

-(CGFloat)zjh_x
{
    return self.frame.origin.x;
}
-(void)setZjh_x:(CGFloat)zjh_x
{
    CGRect frame = self.frame;
    frame.origin.x = zjh_x;
    self.frame = frame;
}

-(CGFloat)zjh_y
{
    return self.frame.origin.y;
}

-(void)setZjh_y:(CGFloat)zjh_y
{
    CGRect frame = self.frame;
    frame.origin.y = zjh_y;
    self.frame = frame;
}

-(CGFloat)zjh_width
{
    return self.frame.size.width;
}

-(void)setZjh_width:(CGFloat)zjh_width
{
    CGRect frame = self.frame;
    frame.size.width = zjh_width;
    self.frame = frame;
}
-(CGFloat)zjh_height
{
    return self.frame.size.height;
}
-(void)setZjh_height:(CGFloat)zjh_height
{
    CGRect frame = self.frame;
    frame.size.height = zjh_height;
    self.frame = frame;
}

-(CGFloat)zjh_centerX
{
    return self.center.x;
}
-(void)setZjh_centerX:(CGFloat)zjh_centerX
{
    CGPoint center = self.center;
    center.x = zjh_centerX;
    self.center = center;
}
-(CGFloat)zjh_centerY
{
    return self.center.y;
}
-(void)setZjh_centerY:(CGFloat)zjh_centerY
{
    CGPoint center = self.center;
    center.y = zjh_centerY;
    self.center = center;
}
-(CGSize)zjh_size
{
    return self.frame.size;
}

-(void)setZjh_size:(CGSize)zjh_size
{
    CGRect frame = self.frame;
    frame.size = zjh_size;
    self.frame = frame;
}

-(CGPoint)zjh_origin
{
    return self.frame.origin;
}
-(void)setZjh_origin:(CGPoint)zjh_origin
{
    CGRect frame = self.frame;
    frame.origin = zjh_origin;
    self.frame = frame;
}

@end
