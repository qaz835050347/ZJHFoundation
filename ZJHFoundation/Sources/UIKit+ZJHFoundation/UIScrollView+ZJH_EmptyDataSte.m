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
    
    Method initWithFrameMethod = class_getClassMethod(self, @selector(initWithFrame:));
    // 获取xmg_imageNamed
    Method zjhswizz_initWithFrameMethod = class_getClassMethod(self, @selector(zjhswizz_initWithFrame:));
    
    // 交互方法:runtime
    method_exchangeImplementations(initWithFrameMethod, zjhswizz_initWithFrameMethod);
    
    Method initWithCoderMethod = class_getClassMethod(self, @selector(initWithCoder:));
    // 获取xmg_imageNamed
    Method zjhswizz_initWithCoderMethod = class_getClassMethod(self, @selector(zjhswizz_initWithCoder:));
    
    // 交互方法:runtime
    method_exchangeImplementations(initWithCoderMethod, zjhswizz_initWithCoderMethod);
    
    
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

- (UIImageView *)loadingView {
    UIImageView *view = objc_getAssociatedObject(self, _cmd);
    if (view != nil) {
        return view;
    }
    UIImageView *loadingView = [[UIImageView alloc] init];
    [loadingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(39);
    }];
    loadingView.animationImages = [self animationImages];
    loadingView.animationDuration = 1;
    loadingView.animationRepeatCount = 0;
    objc_setAssociatedObject(self, _cmd, loadingView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return loadingView;
}

- (NSArray *)animationImages {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:13];
    for (int i=0; i<13; i++) {
        NSString *imgname = [NSString stringWithFormat:@"refresh_%@",@(i)];
        UIImage *image = [UIImage imageNamed:imgname];
        [array addObject:image];
    }
    return [array copy];
}

#pragma mark - DZNEmptyDataSetSource

- (UIView *)customViewForEmptyDataSet:(UIScrollView *)scrollView {
    if (self.status == ZJHEmptyDataSetStatusLoading) {
        UIView *view = [UIView new];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.and.height.mas_equalTo(100);
        }];
        
        [view addSubview:self.loadingView];
        [self.loadingView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(view);
        }];
        [self.loadingView startAnimating];
        
        UILabel *label = [UILabel new];
        label.text = @"努力加载中...";
        label.font = [UIFont systemFontOfSize:14];
//        label.textColor = kSelectedItemColor;
        [view addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.loadingView.mas_bottom).mas_offset(10);
            make.centerX.equalTo(view);
        }];
        return view;
    }
    return nil;
}

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView{
    switch (self.status) {
        case ZJHEmptyDataSetStatusLoading:
            break;
        case ZJHEmptyDataSetStatusNoContent:
            return [UIImage imageNamed:@"noContent"];
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
            break;
        default:
            break;
    }
    if (text) {
        NSMutableAttributedString *attributed = [[NSMutableAttributedString alloc] init];
        
        NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
        paragraph.lineBreakMode = NSLineBreakByWordWrapping;
        paragraph.alignment = NSTextAlignmentCenter;
        
//        NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:16.0f],NSForegroundColorAttributeName: colorFromHexString(@"#999999"),
//                                     NSParagraphStyleAttributeName: paragraph};
//        [attributed setAttributedString:[[NSAttributedString alloc] initWithString:text attributes:attributes]];
        return attributed;
    }
    return nil;
}

- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView
{
    return self.verticalOffset != 0 ? -self.verticalOffset : -50;
}

- (UIImage *)buttonImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state{
    if (self.status == ZJHEmptyDataSetStatusDisconnect) {
        return [UIImage imageNamed:@"reloadBackground"];
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

- (BOOL)emptyDataSetShouldAllowTouch:(UIScrollView *)scrollView {
    return YES;
}

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView {
    
    return self.allowScroll;
}

@end
