//
//  DataTests.m
//  ObjcApiIntroTests
//
//  Created by arimura on 2020/11/26.
//  Copyright © 2020 hormiga6. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface DataTests : XCTestCase

@end

@implementation DataTests

- (void)testStringToData{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"test-vast" ofType:@"xml"];
    NSError *error;
    NSString *str = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    NSLog(@"error :%@",error);
    NSLog(@"str :%@",str);
    NSData *data = [str dataUsingEncoding:kCFStringEncodingUTF8];
    NSLog(@"data :%@",data);
}



@end
