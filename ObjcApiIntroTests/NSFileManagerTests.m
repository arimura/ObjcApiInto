//
//  NSFileManagerTests.m
//  ObjcApiIntroTests
//
//  Copyright © 2019 hormiga6. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface NSFileManagerTests : XCTestCase

@end

@implementation NSFileManagerTests

- (void) testRemoveNonExistingFile {
    NSFileManager *manager = [NSFileManager defaultManager];
    NSError *error;
    [manager removeItemAtPath:@"hoge-fuga" error:&error];
    XCTAssertEqual(error.code, NSFileNoSuchFileError);
}

@end
