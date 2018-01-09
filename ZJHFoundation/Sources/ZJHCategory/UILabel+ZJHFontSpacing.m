//
//  UILabel+ZJHFontSpacing.m
//  ZJHFoundation
//
//  Created by 曾俊晖 on 2018/1/9.
//  Copyright © 2018年 ZJH. All rights reserved.
//

#import "UILabel+ZJHFontSpacing.h"

@implementation UILabel (ZJHFontSpacing)

- (void)zjh_changeLineSpaceForLabel:(NSString *)labelStr WithSpace:(float)space {
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelStr];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelStr length])];
    self.attributedText = attributedString;
    [self sizeToFit];
}

- (void)zjh_changeWordSpaceForLabel:(NSString *)labelStr WithSpace:(float)space {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelStr attributes:@{NSKernAttributeName:@(space)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelStr length])];
    self.attributedText = attributedString;
    [self sizeToFit];
    
}

- (void)zjh_changeSpaceForLabel:(NSString *)labelStr withLineSpace:(float)lineSpace WordSpace:(float)wordSpace {
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelStr attributes:@{NSKernAttributeName:@(wordSpace)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelStr length])];
    self.attributedText = attributedString;
    [self sizeToFit];
    
}

@end
