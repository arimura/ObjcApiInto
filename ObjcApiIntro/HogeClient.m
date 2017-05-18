//
//  HogeClient.m
//  ObjcApiIntro
//
//  Copyright © 2017年 hormiga6. All rights reserved.
//

#import "HogeClient.h"
#import "ObjcApiIntro-Swift.h"

@implementation HogeClient

- (NSString*)getName{
  Hoge* hoge = [[Hoge alloc] init];
  return hoge.getName;
}

@end

