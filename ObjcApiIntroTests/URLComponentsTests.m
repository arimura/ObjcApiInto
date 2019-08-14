//
//  URLComponentsTests.m
//  ObjcApiIntroTests
//
//  Copyright © 2019 hormiga6. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface URLComponentsTests : XCTestCase

@end

@implementation URLComponentsTests

- (void)testPercentEncoding {
    NSURLComponents *components = [NSURLComponents new];
    components.scheme = @"https";
    components.host = @"google.com";
    components.path = @"/";
    components.queryItems = @[[NSURLQueryItem queryItemWithName:@"hoge" value:@"%[,"] ];
    NSLog(@"url is %@", components.URL);
}
@end
