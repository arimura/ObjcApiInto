//
//  DynamicTyping.m
//  ObjcApiIntro
//
//  Copyright © 2017年 hormiga6. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <objc/runtime.h>

@interface Sample : NSObject
@property (nonatomic) NSString *sampleStringToLoad;
@end

@implementation Sample
@end

@interface SampleWithStringLoader : NSObject
@property (nonatomic) NSString *sampleStringToLoad;
- (void)loadString;
@end

@implementation SampleWithStringLoader
- (void)loadString{
    self.sampleStringToLoad = @"abc";
}
@end

@interface DynamicTypingTests : XCTestCase
@end


@implementation DynamicTypingTests

- (void)testShowClassName {
    NSArray *array = [NSArray arrayWithObjects:@"A string",[NSDecimalNumber zero], [NSDate date], nil];
    for (NSInteger idx = 0, len = array.count; idx < len; idx++) {
            id anObject = array[idx];
            NSLog(@"Object ad index:%d is %@", (int)idx, [anObject class]);
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


- (void)testIsaSwizzling {
    Sample *sample = [Sample new];
    NSLog(@"[1] sample's class is %@\n", [sample class]);
    object_setClass(sample, [SampleWithStringLoader class]);
    NSLog(@"[2] sample's class is %@\n", [sample class]);
    
    [sample performSelector:@selector(loadString)];
    
    object_setClass(sample, [Sample class]);
    
    XCTAssertEqual(@"abc", sample.sampleStringToLoad);
}
@end
