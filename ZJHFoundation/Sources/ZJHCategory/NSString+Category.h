//
//  NSString+Category.h
//  ZJHFoundation
//
//  Created by zeng on 2018/6/20.
//  Copyright © 2018年 ZJH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Category)

/**
 float 类型，保留小数，只舍不入
 
 @param price float类型参数
 @param position 保留几位小数
 @return 返回需要的字符串
 */
-(NSString *)notRounding:(float)price afterPoint:(int)position;

///价格格式化保留两位小数
-(NSString *)priceString;

@end
