//
//  TypedefTests.m
//  ObjcApiIntro
//
//  Copyright © 2017年 hormiga6. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface TypedefTests : XCTestCase
@end

typedef int Length;

typedef char *String;

typedef struct tnode *Treeptr;

typedef struct tnode{
    char *word;
    int count;
    Treeptr left;
    Treeptr right;
} Treenode;

@implementation TypedefTests

- (void)testLength {
    int i = 100;
    Length l = 100;
    XCTAssertTrue(i == l);
}

-(void)testString{
    String s = "hoge";
    char *c = "hoge";
    XCTAssertEqual(0, strcmp(s, c));
}

@end
