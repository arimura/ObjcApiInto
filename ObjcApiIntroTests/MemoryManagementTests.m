//
//  MemoryManagementTests.m
//  ObjcApiIntro
//
//  Copyright © 2017年 hormiga6. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface Hoge : NSString
@end

@implementation Hoge
- (void)dealloc {
    NSLog(@"dealloc called");
}
@end


@interface MemoryManagementTests : XCTestCase
@end

@implementation MemoryManagementTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testDeallocImmedeately {
    {
        [Hoge new];
        NSLog(@"end of inner block");
    }
    NSLog(@"start outer block ");
}

- (void)testDeallocAfterBlock {
    {
        Hoge *hoge = [Hoge new];
        #pragma unused(hoge)
        NSLog(@"end of inner block");
    }
    NSLog(@"start outer block ");
}
@end
