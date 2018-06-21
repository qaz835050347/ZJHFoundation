//
//  NSString+Category.m
//  ZJHFoundation
//
//  Created by zeng on 2018/6/20.
//  Copyright © 2018年 ZJH. All rights reserved.
//

#import "NSString+Category.h"

@implementation NSString (Category)

-(NSString *)priceString
{
     return [NSString stringWithFormat:@"%@",[self notRounding:[self floatValue] afterPoint:2]];
}

/**
 float 类型，保留小数，只舍不入
 
 @param price float类型参数
 @param position 保留几位小数
 @return 返回需要的字符串
 */
-(NSString *)notRounding:(float)price afterPoint:(int)position{
    NSDecimalNumberHandler* roundingBehavior;
    if (price < 0) {///判断传入的数字是否小于0 小于0的时候 只入不舍 反正 只舍不入
        ///只入不舍
        roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundUp scale:position raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
        ///当参数值为负数的时候，-1.2456 保留两位小数 只舍不入后的值是 -1.25 不是我们需要的值-1.24 所以需要反之 只入不舍才能获取到我们需要的值-1.24
    }else
    {
        ///只舍不入
        roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown scale:position raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
        
    }
    NSDecimalNumber *ouncesDecimal;
    NSDecimalNumber *roundedOunces;
    
    ouncesDecimal = [[NSDecimalNumber alloc] initWithFloat:price];
    roundedOunces = [ouncesDecimal decimalNumberByRoundingAccordingToBehavior:roundingBehavior];
    
    return [NSString stringWithFormat:@"%@",roundedOunces];
}

-(BOOL)isEqualNull
{
    if (![self isKindOfClass:[NSString class]]) {
        return YES;
    }
    if (self.length == 0) {
        return YES;
    }
    NSString* trimString = self.SR_trimString;
    if (trimString.length == 0) {
        return YES;
    }
    NSString* lowercaseString = self.lowercaseString;
    if ([lowercaseString isEqualToString:@"(null)"] || [lowercaseString isEqualToString:@"null"] || [lowercaseString isEqualToString:@"<null>"]) {
        return YES;
    }
    return NO;
}

-(NSString *)SR_trimString
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

-(NSString *)SR_trimAllSpace
{
    NSString *trimed = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    trimed = [trimed stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    trimed = [trimed stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    trimed = [trimed stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    return trimed;
}

@end
