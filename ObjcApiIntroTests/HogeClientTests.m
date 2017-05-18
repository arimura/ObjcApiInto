//
//  HogeClientTests.m
//  ObjcApiIntro
//
//  Copyright © 2017年 hormiga6. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HogeClient.h"

@interface HogeClientTests : XCTestCase
@end

//You can't test swift class by objc test cases
@implementation HogeClientTests

- (void)testGetName {
  HogeClient* hogeClient = [[HogeClient alloc] init];
  XCTAssertEqualObjects(hogeClient.getName, @"Hoge");
}

@end
