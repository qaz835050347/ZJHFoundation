//
//  NSObject+ZJHSwizzle.h
//  ZJHFoundation
//
//  Created by 曾俊晖 on 2018/4/26.
//  Copyright © 2018年 ZJH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ZJHSwizzle)

+ (BOOL)zjh_swizzleMethod:(SEL)origSel_ withMethod:(SEL)altSel_ error:(NSError**)error_;
+ (BOOL)zjh_swizzleClassMethod:(SEL)origSel_ withClassMethod:(SEL)altSel_ error:(NSError**)error_;

@end

@interface NSProxy (ZJHSwizzle)

+ (BOOL)zjh_swizzleMethod:(SEL)origSel_ withMethod:(SEL)altSel_ error:(NSError**)error_;
+ (BOOL)zjh_swizzleClassMethod:(SEL)origSel_ withClassMethod:(SEL)altSel_ error:(NSError**)error_;

@end
