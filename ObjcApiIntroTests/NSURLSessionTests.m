//
//  NSURLSessionTests.m
//  ObjcApiIntroTests
//
//  Copyright © 2020 hormiga6. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface NSURLSessionTests : XCTestCase

@end

@implementation NSURLSessionTests

-(void)testConfigurationDefaults {
    __auto_type defaut = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSLog(@"timeoutIntervalForRequest: %f", defaut.timeoutIntervalForRequest);
    NSLog(@"timeoutIntervalForResource: %f", defaut.timeoutIntervalForResource);
    NSLog(@"HTTPMaximumConnectionsPerHost: %ld", defaut.HTTPMaximumConnectionsPerHost);
}

@end
