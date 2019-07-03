//
//  ConditionalTests.m
//  ObjcApiIntroTests
//
//  Copyright © 2019 hormiga6. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface ConditionalTests : XCTestCase

@end

@implementation ConditionalTests

- (void)testLierals {
    XCTAssertTrue(@"");
    XCTAssertTrue(2);
    XCTAssertTrue(@{});
    XCTAssertFalse(nil);
    XCTAssertFalse(0);
}
@end
