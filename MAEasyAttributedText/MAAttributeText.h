//
//  MAAttributeString.h
//  YiJieDai
//
//  Created by YURI_JOU on 15/9/30.
//  Copyright © 2015年 oenius. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MAAttributeSegment : NSObject

@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) NSString *text;

- (instancetype)initFont:(UIFont *)font text:(NSString *)text;

- (instancetype)initTextColor:(UIColor *)textColor text:(NSString *)text;

- (instancetype)initFont:(UIFont *)font textColor:(UIColor *)textColor text:(NSString *)text;

@end

@interface MAAttributeText: NSObject

- (instancetype)initWithSegments:(NSArray *)segs;

- (void)append:(MAAttributeSegment *)segment;

- (void)setSegments:(NSArray*)segments;

- (void)clear;

- (NSAttributedString *)attributedText;

@end
