//
//  RequestOpTests.m
//  ObjcApiIntro
//
//  Copyright © 2017年 hormiga6. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface RequestOpTests : XCTestCase

@end

@implementation RequestOpTests

- (void)testRequestWithDependency {
    NSBlockOperation *lastOp = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"done lastOp");
    }];
    __block NSBlockOperation *googleOp = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"done googleOp");
    }];
    __block NSBlockOperation *amazonOp = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"done amazonOp");
    }];
    
    NSOperationQueue *q = [[NSOperationQueue alloc]init];
    q.maxConcurrentOperationCount = 2;
    [lastOp addDependency:googleOp];
    [lastOp addDependency:amazonOp];
    [q addOperation:lastOp];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:@"https://google.com"]
                                completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
         NSLog(@"finish requesting google");
        [q addOperation:googleOp];
    }] resume];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:@"https://amazon.com"]
                                completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
         NSLog(@"finish requesting amazon");
        [q addOperation:amazonOp];
    }] resume];
    
    [q waitUntilAllOperationsAreFinished];
}
@end
