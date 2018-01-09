//
//  ZJH_AlertView.h
//  SKU_Demo
//
//  Created by 曾俊晖 on 2017/12/21.
//  Copyright © 2017年 曾俊晖. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZJH_AlertView : UIView

@property (nonatomic, copy) void(^resultIndex)(NSInteger index);

/**
 实例化AlertView

 @param title 标题
 @param message 提醒信息
 @param sureTitle 左按钮
 @param cancleTitle 右按钮
 @return view
 */
- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message sureBtn:(NSString *)sureTitle cancleBtn:(NSString *)cancleTitle;

///显示
- (void)showZJHAlertView;

@end
