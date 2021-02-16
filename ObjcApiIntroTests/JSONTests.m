//
//  JSONTests.m
//  ObjcApiIntroTests
//
//  Created by arimura on 2021/02/16.
//  Copyright © 2021 hormiga6. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface JSONTests : XCTestCase

@end

@implementation JSONTests

-(void)testJSONSerializeOption{
    __auto_type dic = @{@"hoge":@1, @"fuga":@2};
    __auto_type data1 = [NSJSONSerialization dataWithJSONObject:dic
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:nil];
    NSLog(@"pretty print %@", [[NSString alloc]initWithData:data1 encoding:NSUTF8StringEncoding]);

    __auto_type data2= [NSJSONSerialization dataWithJSONObject:dic
                                                       options:0
                                                         error:nil];
    NSLog(@"zero %@", [[NSString alloc]initWithData:data2 encoding:NSUTF8StringEncoding]);

}
@end
