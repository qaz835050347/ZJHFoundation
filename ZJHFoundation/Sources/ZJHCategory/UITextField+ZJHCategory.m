//
//  UITextField+ZJHCategory.m
//  ZJHFoundation
//
//  Created by 曾俊晖 on 2018/1/9.
//  Copyright © 2018年 ZJH. All rights reserved.
//

#import "UITextField+ZJHCategory.h"
#import <objc/runtime.h>

static char zjh_MaxLength;

@interface UItextFieldMaxLengthObserver : NSObject

@end

@implementation UItextFieldMaxLengthObserver

- (void)textChange:(UITextField *)textField {
    NSString *destText = textField.text;
    NSUInteger maxLength = textField.maxLength;
    
    // 对中文的特殊处理，shouldChangeCharactersInRangeWithReplacementString 并不响应中文输入法的选择事件
    // 如拼音输入时，拼音字母处于选中状态，此时不判断是否超长
    UITextRange *selectedRange = [textField markedTextRange];
    if (!selectedRange || !selectedRange.start) {
        if (destText.length > maxLength) {
            textField.text = [destText substringToIndex:maxLength];
        }
    }
}

@end

static UItextFieldMaxLengthObserver *observer;

@implementation UITextField (ZJHCategory)

+ (void)load {
    observer = [[UItextFieldMaxLengthObserver alloc] init];
}


-(NSInteger)maxLength
{
    NSNumber *number = objc_getAssociatedObject(self, &zjh_MaxLength);
    return [number integerValue];
}

-(void)setMaxLength:(NSInteger)maxLength
{
    objc_setAssociatedObject(self, &zjh_MaxLength, @(maxLength), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (maxLength) {
        [self addTarget:observer
                 action:@selector(textChange:)
       forControlEvents:UIControlEventEditingChanged];
    }
    
}

-(BOOL)isNumber
{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

-(void)setIsNumber:(BOOL)isNumber
{
    return objc_setAssociatedObject(self, @selector(isNumber), @(isNumber), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
