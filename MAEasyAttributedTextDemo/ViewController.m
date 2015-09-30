//
//  ViewController.m
//  MAEasyAttributedTextDemo
//
//  Created by YURI_JOU on 15/9/30.
//  Copyright © 2015年 oenius. All rights reserved.
//

#import "ViewController.h"
#import "MAAttributeText.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor blackColor];
  
  MAAttributeSegment *prefix = [[MAAttributeSegment alloc]initFont:[UIFont systemFontOfSize:14.f weight:10.f]
                                                         textColor:[UIColor whiteColor]
                                                              text:@"I'm relly enjoy the"];
  
  MAAttributeSegment *sample = [[MAAttributeSegment alloc]initFont:[UIFont systemFontOfSize:14.f weight:10.f]
                                                         textColor:[UIColor orangeColor]
                                                              text:@" Sample "];
  
  MAAttributeSegment *trail = [[MAAttributeSegment alloc]initFont:[UIFont systemFontOfSize:14.f weight:10.f]
                                                         textColor:[UIColor whiteColor]
                                                              text:@"code life"];
  MAAttributeText *attributedText = [[MAAttributeText alloc]initWithSegments:@[prefix, sample, trail]];
  self.textLabel.attributedText = attributedText.attributedText;
  
}

@end
