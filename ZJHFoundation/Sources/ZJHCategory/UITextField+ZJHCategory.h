//
//  UITextField+ZJHCategory.h
//  ZJHFoundation
//
//  Created by 曾俊晖 on 2018/1/9.
//  Copyright © 2018年 ZJH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (ZJHCategory)

///输入框最长度
@property (nonatomic, assign) IBInspectable NSInteger maxLength;
///输入是否为纯数字
@property (nonatomic, assign) BOOL isNumber;

@end
