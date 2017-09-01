//
//  EnumTests.m
//  ObjcApiIntro
//
//  Copyright © 2017年 hormiga6. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface EnumTests : XCTestCase
@end

enum month {JAN =1, FEB, MAR, APR, MAY, JUN, JUL, AUG, SEP, OCT, NOV, DEC, };

typedef NS_ENUM(NSInteger, Type) {
    T_HOGE = 1,
    T_FUGA
};

typedef NS_OPTIONS(NSUInteger, OpType){
    OT_HOGE,
    OT_FUGA
};

@implementation EnumTests

- (void)testMonth {
    enum month j = JAN;
    printf("JAN is %d\n", j);
}

-(void)testType {
    Type t = T_FUGA;
    XCTAssertEqual(t, 2);
}

- (void)testOpType {
    printf("OP_HOGE is %#08x\n", OT_HOGE);
    printf("OP_FUGA is %#08x\n", OT_FUGA);
}
@end
