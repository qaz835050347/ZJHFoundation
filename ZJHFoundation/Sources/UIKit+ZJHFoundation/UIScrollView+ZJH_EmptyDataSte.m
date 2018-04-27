//
//  UIScrollView+ZJH_EmptyDataSte.m
//  ZJHFoundation
//
//  Created by 曾俊晖 on 2018/4/24.
//  Copyright © 2018年 ZJH. All rights reserved.
//

#import "UIScrollView+ZJH_EmptyDataSte.h"
#import <objc/runtime.h>

@implementation UIScrollView (ZJH_EmptyDataSte)

+(void)load {
    ///此处实现系统方法和自己的方法进行交换
    [self zjh_swizzleMethod:@selector(initWithFrame:) withMethod:@selector(zjhswizz_initWithFrame:) error:nil];
    [self zjh_swizzleMethod:@selector(initWithCoder:) withMethod:@selector(zjhswizz_initWithCoder:) error:nil];
}

- (void)setUpSourceAndDelegate {
    self.emptyDataSetSource = self;
    self.emptyDataSetDelegate = self;
}

#pragma mark - swizz method

- (instancetype)zjhswizz_initWithFrame:(CGRect)frame {
    UIScrollView *view = [self zjhswizz_initWithFrame:frame];
    [view setUpSourceAndDelegate];
    return view;
}

- (instancetype)zjhswizz_initWithCoder:(NSCoder *)aDecoder {
    UIScrollView *view = [self zjhswizz_initWithCoder:aDecoder];
    [view setUpSourceAndDelegate];
    return view;
}

#pragma mark - get & set

- (void)setStatus:(ZJHEmptyDataSetStatus)status {
    [self reloadEmptyDataSet];
    return objc_setAssociatedObject(self, @selector(status), @(status), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (ZJHEmptyDataSetStatus)status {
    return [objc_getAssociatedObject(self, _cmd) integerValue];
}

- (void)setSuccessImage:(NSString *)successImage {
    return objc_setAssociatedObject(self, @selector(successImage), successImage, OBJC_ASSOCIATION_COPY);
}

- (NSString *)successImage {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setSuccessTitle:(NSString *)successTitle {
    return objc_setAssociatedObject(self, @selector(successTitle), successTitle, OBJC_ASSOCIATION_COPY);
}

- (NSString *)successTitle {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setVerticalOffset:(CGFloat)verticalOffset {
    return objc_setAssociatedObject(self, @selector(verticalOffset), @(verticalOffset), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)verticalOffset {
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}

- (void)setAllowScroll:(BOOL)allowScroll {
    return objc_setAssociatedObject(self, @selector(allowScroll), @(allowScroll), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)allowScroll {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setEmptyDataSetDidTapAction:(void (^)())emptyDataSetDidTapAction {
    return objc_setAssociatedObject(self, @selector(emptyDataSetDidTapAction), emptyDataSetDidTapAction, OBJC_ASSOCIATION_COPY);
}

- (void (^)())emptyDataSetDidTapAction {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setEmptyDataSetDidDisappear:(void (^)(UIScrollView *))emptyDataSetDidDisappear {
    return objc_setAssociatedObject(self, @selector(emptyDataSetDidDisappear), emptyDataSetDidDisappear, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UIScrollView *))emptyDataSetDidDisappear {
    return objc_getAssociatedObject(self, _cmd);
}

- (CAAnimation *)imageAnimationForEmptyDataSet:(UIScrollView *)scrollView
{
    CAKeyframeAnimation *scaleAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnim.keyTimes = @[@0, @0.5, @1];
    scaleAnim.values = @[@1, @0.6, @1];


    CAKeyframeAnimation *rotateAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotateAnimation.keyTimes = scaleAnim.keyTimes;
    rotateAnimation.values = @[@0, @(M_PI), @(2 * M_PI)];

    CAAnimationGroup *groupAnim = [[CAAnimationGroup alloc] init];
    groupAnim.animations = @[scaleAnim,rotateAnimation];
    groupAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    groupAnim.duration = 1;
    groupAnim.removedOnCompletion = NO;
    groupAnim.repeatCount = MAXFLOAT;
    return groupAnim;
}

#pragma mark - DZNEmptyDataSetSource

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView{
    
    if (self.successImage.length > 0) {
        return [UIImage imageNamed:self.successImage];
    }
    
    switch (self.status) {
        case ZJHEmptyDataSetStatusLoading:
            return [UIImage imageNamed:@"loading1"];
            break;
        case ZJHEmptyDataSetStatusNoContent:
            return [UIImage imageNamed:@"NoData"];
            break;
        case ZJHEmptyDataSetStatusEmpty:
            break;
        case ZJHEmptyDataSetStatusSuccess:
            return [UIImage imageNamed:@""];
            break;
        case ZJHEmptyDataSetStatusError:
            return [UIImage imageNamed:@"noNet"];
            break;
        case ZJHEmptyDataSetStatusDisconnect:
            return [UIImage imageNamed:@"noNet"];
            break;
        case ZJHEmptyDataSetStatusUnkonw:
            break;
        default:
            break;
    }
    return nil;
}

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView{
    if (self.successTitle.length > 0) {
        if (self.successTitle) {
            NSMutableAttributedString *attributed = [[NSMutableAttributedString alloc] init];
            
            NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
            paragraph.lineBreakMode = NSLineBreakByWordWrapping;
            paragraph.alignment = NSTextAlignmentCenter;
            
            NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:16.0f],NSForegroundColorAttributeName: [UIColor darkGrayColor],
                                         NSParagraphStyleAttributeName: paragraph};
            [attributed setAttributedString:[[NSAttributedString alloc] initWithString:self.successTitle attributes:attributes]];
            return attributed;
        }
    }
    NSString *text = nil;
    switch (self.status) {
        case ZJHEmptyDataSetStatusLoading:
            break;
        case ZJHEmptyDataSetStatusNoContent:
            text = @"还没有内容哦~";
            break;
        case ZJHEmptyDataSetStatusEmpty:
            break;
        case ZJHEmptyDataSetStatusSuccess:
            text = self.successTitle;
            break;
        case ZJHEmptyDataSetStatusError:
            text = @"服务器发生了一点错误";
            break;
        case ZJHEmptyDataSetStatusDisconnect:
            text = @"网络请求失败";
            break;
        case ZJHEmptyDataSetStatusUnkonw:
            text = @"与服务器连接失败";
            break;
        default:
            break;
    }
    if (text) {
        NSMutableAttributedString *attributed = [[NSMutableAttributedString alloc] init];
        
        NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
        paragraph.lineBreakMode = NSLineBreakByWordWrapping;
        paragraph.alignment = NSTextAlignmentCenter;
        
        NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:16.0f],NSForegroundColorAttributeName: [UIColor darkGrayColor],
                                     NSParagraphStyleAttributeName: paragraph};
        [attributed setAttributedString:[[NSAttributedString alloc] initWithString:text attributes:attributes]];
        return attributed;
    }
    return nil;
}

- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView
{
    return self.verticalOffset != 0 ? -self.verticalOffset : -50;
}

- (UIImage *)buttonImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state{
    if (self.status == ZJHEmptyDataSetStatusDisconnect || self.status == ZJHEmptyDataSetStatusError || self.status == ZJHEmptyDataSetStatusUnkonw) {
        return [UIImage imageNamed:@"reloadBackground"];
    }
    return nil;
}
- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    if (self.status == ZJHEmptyDataSetStatusDisconnect || self.status == ZJHEmptyDataSetStatusError || self.status == ZJHEmptyDataSetStatusUnkonw) {
        NSMutableAttributedString *attributed = [[NSMutableAttributedString alloc] init];
        
        NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
        paragraph.lineBreakMode = NSLineBreakByWordWrapping;
        paragraph.alignment = NSTextAlignmentCenter;
        
        NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:16.0f],NSForegroundColorAttributeName: [UIColor blueColor],
                                     NSParagraphStyleAttributeName: paragraph};
        [attributed setAttributedString:[[NSAttributedString alloc] initWithString:@"重新加载" attributes:attributes]];
        return attributed;
    }
    return nil;
}

#pragma mark - DZNEmptyDataSetDelegate

- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button{
    if (self.emptyDataSetDidTapAction) {
        self.emptyDataSetDidTapAction();
    }
}

- (void)emptyDataSetDidDisappear:(UIScrollView *)scrollView {
    if (self.emptyDataSetDidDisappear) {
        self.emptyDataSetDidDisappear(scrollView);
    }
}

- (BOOL)emptyDataSetShouldAnimateImageView:(UIScrollView *)scrollView{
    if (self.status == ZJHEmptyDataSetStatusLoading) {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)emptyDataSetShouldAllowTouch:(UIScrollView *)scrollView {
    return YES;
}

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView {
    
    return self.allowScroll;
}

@end
