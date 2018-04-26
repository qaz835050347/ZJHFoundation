//
//  UIScrollView+ZJH_EmptyDataSte.h
//  ZJHFoundation
//
//  Created by 曾俊晖 on 2018/4/24.
//  Copyright © 2018年 ZJH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>

typedef NS_ENUM(NSUInteger,ZJHEmptyDataSetStatus) {
    ZJHEmptyDataSetStatusLoading = 0,//loading
    ZJHEmptyDataSetStatusNoContent,//暂时没有数据
    ZJHEmptyDataSetStatusEmpty,//显示空白
    ZJHEmptyDataSetStatusSuccess,//成功
    ZJHEmptyDataSetStatusError,//错误
    ZJHEmptyDataSetStatusDisconnect,//没有网络连接
    ZJHEmptyDataSetStatusUnkonw//未知
};

@interface UIScrollView (ZJH_EmptyDataSte)<DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>
///状态
@property (nonatomic, assign) ZJHEmptyDataSetStatus status;
@property (nonatomic, assign) CGFloat verticalOffset;
///无数据，或者失败情况下是否可以滑动 默认为NO
@property (nonatomic, assign) BOOL allowScroll;
@property (nonatomic, copy) NSString *successImage;
@property (nonatomic, copy) NSString *successTitle;
///重新加载按钮事件
@property (nonatomic, copy) void (^emptyDataSetDidTapAction)();
@property (nonatomic, copy) void (^emptyDataSetDidDisappear)(UIScrollView *scrollView);

@end
