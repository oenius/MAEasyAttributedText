//
//  MAAttributeString.m
//  YiJieDai
//
//  Created by YURI_JOU on 15/9/30.
//  Copyright © 2015年 oenius. All rights reserved.
//

#import "MAAttributeText.h"

@implementation MAAttributeSegment

#pragma mark - getter
- (NSString *)text
{
  if (!_text) {
    return @"";
  }
  return _text;
}

- (UIFont *)font
{
  if (!_font) {
    return [UIFont systemFontOfSize:12.f];
  }
  return _font;
}

- (UIColor *)textColor
{
  if (!_textColor) {
    return [UIColor blackColor];
  }
  return _textColor;
}

- (instancetype)initFont:(UIFont *)font text:(NSString *)text
{
  self = [super init];
  if (self)
  {
    _font = font;
    _text = text;
  }
  return self;
}

- (instancetype)initTextColor:(UIColor *)textColor text:(NSString *)text
{
  self = [super init];
  if (self)
  {
    _textColor = textColor;
    _text = text;
  }
  return self;
}

- (instancetype)initFont:(UIFont *)font textColor:(UIColor *)textColor text:(NSString *)text
{
  self = [super init];
  if (self)
  {
    _font = font;
    _textColor = textColor;
    _text = text;
  }
  return self;
}

@end

@interface MAAttributeText()

@property (nonatomic, strong) NSMutableAttributedString *attributedString;
@property (nonatomic, strong) NSMutableArray *attributes;

@end
@implementation MAAttributeText

- (instancetype)init
{
  self = [super init];
  if (self) {
    self.attributes = [@[] mutableCopy];
  }
  return self;
}

- (instancetype)initWithSegments:(NSArray *)segs
{
  self = [self init];
  if (self) {
    [self setSegments:segs];
  }
  return self;
}

- (void)append:(MAAttributeSegment *)segment;
{
  [self.attributes addObject:segment];
}

- (void)clear
{
  [self.attributes removeAllObjects];
}

- (void)setSegments:(NSArray *)segments
{
  self.attributes = [segments mutableCopy];
}

- (NSAttributedString *)attributedText
{
  NSMutableArray *ranges = [@[] mutableCopy];
  NSMutableArray *attributes = [@[] mutableCopy];
  
  NSMutableString *strings = [NSMutableString string];
  
  for(NSInteger pos = 0; pos < self.attributes.count; pos++)
  {
    [attributes addObject:@{
                           NSFontAttributeName: [self.attributes[pos] font],
                           NSForegroundColorAttributeName:[self.attributes[pos] textColor]
                           }];
    
    NSString *text = [self.attributes[pos] text];
    [strings appendString:text];
    
    NSRange range = [text rangeOfString:text];
    [ranges addObject:[NSValue valueWithRange:range]];
  }
  
  NSMutableAttributedString *attributed = [[NSMutableAttributedString alloc]
                                                 initWithString:strings];
  
  NSInteger trail = 0;
  for (NSInteger pos = 0; pos < ranges.count; ++pos) {
    NSRange range = [ranges[pos] rangeValue];
    range.location = trail;
    [attributed addAttributes:attributes[pos] range:range];
    trail = range.location + range.length;
  }
  return  [attributed copy];
}


@end
