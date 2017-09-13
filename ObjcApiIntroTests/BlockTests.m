//
//  BlockTests.m
//  ObjcApiIntro
//
//  Copyright © 2017年 hormiga6. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Block.h>

typedef int (^myBlock)(int);

void func(myBlock block)
{
    int v = block(10);
    printf("%d\n",v);
}

int hoge = 1000;


void (^g)(void) = NULL;
int c = 0;

void func2(int n){
    __block int sh = 0;
    void (^b1)(void) = ^{
        sh += 1;
        printf("%d: b1, n=%d, sh=%d\n", c++, n, sh);
    };
    void (^b2)(void) = ^{
        sh += 20;
        printf("%d: b2, n=%d, sh=%d\n", c++, n, sh);
    };
    b1();
    b2();
    g = [b1 copy];
    sh += n * 1000;
    n = 999;
    b2();
}

@interface BlockTests : XCTestCase
@end

@implementation BlockTests

- (void)testSimpleBlock {
    void (^b)(int) = ^(int i){ printf("%d\n", i);};
    b(5);
}

- (void)testBlockArgument {
    int (^b)(int) = ^(int x){ return x * 2;};
    printf("%d\n",b(4));
    func(b);
    func(^int(int a) {
        int i, k = 0;
        for (i = a; i > 0; i--)k += i;
        return k;
    });
}

- (void)testAbbrev{
    void (^foo1)(void) = ^(void){printf("hoge\n");};
    void (^foo2)(void) = ^{printf("hoge\n");};
    void (^foo3)(void) = ^(){printf("hoge\n");};
    foo1();
    foo2();
    foo3();
}

- (void)testClosure{
    static int fuga = 2000;
    int bar = 3000;
    void (^block)(void) = ^{
        printf("hoge is %d\n", hoge);
        printf("fuga is %d\n", fuga);
        printf("bar is %d\n", bar);
    };
    block();
    hoge++;
    fuga++;
    bar++;
    block();
}

- (void)testBlockModifier{
    void (^myblock)(void);
    func2(1);
    myblock = g;
    myblock();
    func2(2);
    myblock();
}

@end
