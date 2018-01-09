//
//  UILabel+ZJHFontSpacing.h
//  ZJHFoundation
//
//  Created by 曾俊晖 on 2018/1/9.
//  Copyright © 2018年 ZJH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (ZJHFontSpacing)

/**
 改变行间距

 @param labelStr <#labelStr description#>
 @param space <#space description#>
 */
- (void)zjh_changeLineSpaceForLabel:(NSString *)labelStr WithSpace:(float)space;
/**
 改变字间距

 @param labelStr 给Label设置的字符
 @param space 字间距
 */
- (void)zjh_changeWordSpaceForLabel:(NSString *)labelStr WithSpace:(float)space;
/**
 改变行间距和字间距

 @param labelStr 给Label设置的字符
 @param lineSpace 行间距
 @param wordSpace 字间距
 */
- (void)zjh_changeSpaceForLabel:(NSString *)labelStr withLineSpace:(float)lineSpace WordSpace:(float)wordSpace;

@end
