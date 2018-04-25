//
//  ZJH_ImageCompressionClass.h
//  ZJHFoundation
//
//  Created by 曾俊晖 on 2018/4/25.
//  Copyright © 2018年 ZJH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZJH_ImageCompressionClass : NSObject

/**
 压缩图片转换成data数据

 @param sourceImage 传入需要压缩的图片
 @return 返回图片data数据
 */
+(NSData *)zipNSDataWithImage:(UIImage *)sourceImage;

/**
 压缩图片 等比例压缩后转换成data数据

 @param sourceImage 传入需要压缩的图片
 @return 返回等比压缩图片data数据
 */
+(NSData *)zipScaleNSDataWithImage:(UIImage *)sourceImage;

/**
 压缩图片 等比例压缩

 @param sourceImage 传入需要压缩的图片
 @return 返回压缩后的图片
 */
+(UIImage *)zipScaleWithImage:(UIImage *)sourceImage;

@end
