//
//  CharSetTests.m
//  ObjcApiIntroTests
//
//  Copyright © 2019 hormiga6. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface CharSetTests : XCTestCase

@end

@implementation CharSetTests

- (void)testURLQueryAllowedCharacterSet{
    NSCharacterSet *set = [NSCharacterSet URLQueryAllowedCharacterSet];
    NSString *allAscii = @" !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
    NSUInteger l = [allAscii length];
    unichar buf[l];
    [allAscii getCharacters:buf range: NSMakeRange(0, l)];
    for (int i=0; i < l; i++){
        if (![set characterIsMember:buf[i]]){
            NSLog(@"Not allowed char is %C", buf[i]);
        }
    }
}

@end
