//
//  RuntimeTests.m
//  ObjcApiIntro
//
//  Copyright © 2017年 hormiga6. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <objc/runtime.h>
#import <objc/message.h>

@interface HRMGHoge : NSObject
- (void)staticSay;
- (void)say;
@end

@implementation HRMGHoge
- (void)staticSay {
    NSLog(@"Static Hoge");
}
- (void)say {
    NSLog(@"Hoge");
}
@end

@interface RuntimeTests : XCTestCase
+ (void)printInheritTree:(id)obj index:(int)index;
@end

@implementation RuntimeTests
+ (void)printInheritTree:(id)obj index:(int)index{
    NSString *indent = [@"" stringByPaddingToLength:index withString:@" " startingAtIndex:0];
    NSLog(@"%@ class: %@ pointer: %p",indent, obj,obj);
    Class clazz = [obj class];
    if (obj != clazz){
        NSLog(@"%@ print class",indent);
        [RuntimeTests printInheritTree:clazz index:index+1];
    }else {
        NSLog(@"%@ class return same object", indent);
    }
    
    Class superClass = [obj superclass];
    if (obj != superClass){
        NSLog(@"%@ print super class",indent);
        [RuntimeTests printInheritTree:superClass index:index+1];
    }else {
        NSLog(@"%@ superClas return same object", indent);
    }
}

- (void)testMsgSend {
    id hoge = [[HRMGHoge alloc]init];
    ((void(*)(id, SEL))objc_msgSend)(hoge, @selector(say));
}

- (void)testClass {
    HRMGHoge *hoge = [[HRMGHoge alloc]init];
    [RuntimeTests printInheritTree:hoge index:0];
}
@end
