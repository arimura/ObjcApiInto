//
//  DynamicTyping.m
//  ObjcApiIntro
//
//  Copyright © 2017年 hormiga6. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface DynamicTypingTests : XCTestCase

@end

@implementation DynamicTypingTests

- (void)testShowClassName {
    NSArray *array = [NSArray arrayWithObjects:@"A string",[NSDecimalNumber zero], [NSDate date], nil];
    for (NSInteger idx, len = array.count; idx < len; idx++) {
            id anObject = array[idx];
            NSLog(@"Object ad index:%d is %@", idx, [anObject class]);
    }
}

- (void)testInvalidSelector {
    @try {
        id string = @"";
        //can compile
        [string addObject:@"Add me!"];
        //can't compile. method hoge does't exist on all classes
        //[string hoge:@"Add me!"];
    } @catch (NSException *exception) {
        NSLog(@"caught %@", exception);
    }
}
@end
