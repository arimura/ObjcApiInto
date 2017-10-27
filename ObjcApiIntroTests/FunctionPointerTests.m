//
//  FunctionPointerTests.m
//  ObjcApiIntroTests
//
//  Copyright © 2017年 hormiga6. All rights reserved.
//

#import <XCTest/XCTest.h>

int f(int x){
    return x + 1;
}

@interface FunctionPointerTests : XCTestCase
@end

@implementation FunctionPointerTests
- (void)testFunctionPointer {
    int (*v)(int) = f;
    XCTAssertEqual((*v)(2), 3);
    XCTAssertEqual(v(2), 3);
    
    typedef int (*MYF)(int);
    MYF w = f;
    XCTAssertEqual(w(3), 4);
}
@end
