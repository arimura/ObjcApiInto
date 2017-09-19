//
//  CopyTests.m
//  ObjcApiIntro
//
//  Copyright © 2017年 hormiga6. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface CopyTests : XCTestCase

@end

@implementation CopyTests

- (void)testShallowCopy {
    NSObject *obj = [[NSObject alloc] init];
    NSDictionary *hoge = @{@"foo":@(1), @"foobar":obj};
    NSMutableDictionary *fuga = [hoge mutableCopy];

    XCTAssertTrue(hoge != fuga);
    NSLog(@"%p",hoge);
    NSLog(@"%p",fuga);
    
    fuga[@"bar"] = @(2);
    XCTAssertNotNil(fuga[@"bar"]);
    XCTAssertNil(hoge[@"bar"]);
    
    XCTAssertTrue(hoge[@"foobar"] == fuga[@"foobar"]);
}

@end
