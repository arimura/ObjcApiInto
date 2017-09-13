//
//  SortTests.m
//  ObjcApiIntro
//
//  Copyright © 2017年 hormiga6. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface HogeSort : NSObject
@property (nonatomic) NSInteger order;
- (instancetype)initWithOrder:(NSInteger)order;
@end

@implementation HogeSort
- (instancetype)initWithOrder:(NSInteger)order{
    self = [super init];
    if(self ){
        _order = order;
    }
    return self;
}
@end

@interface FugaSort : NSObject
@property (nonatomic) HogeSort *hoge;
- (instancetype)initWithHogeSoer:(HogeSort*)hogeSort;
@end

@implementation FugaSort
- (instancetype)initWithHogeSoer:(HogeSort*)hogeSort {
    self = [super init];
    if(self){
        _hoge = hogeSort;
     }
     return self;
}
@end


@interface SortTests : XCTestCase
@end

@implementation SortTests

- (void)testSortDescriptor {
    NSArray *array = @[
        [[FugaSort alloc]initWithHogeSoer: [[HogeSort alloc]initWithOrder:3]],
        [[FugaSort alloc]initWithHogeSoer: [[HogeSort alloc]initWithOrder:1]],
        [[FugaSort alloc]initWithHogeSoer: [[HogeSort alloc]initWithOrder:2]]
    ];

    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc]initWithKey:@"hoge.order" ascending:YES];
    NSArray<FugaSort*> *sorted = [array sortedArrayUsingDescriptors:@[descriptor]];
    XCTAssertEqual(1, sorted[0].hoge.order);
    XCTAssertEqual(2, sorted[1].hoge.order);
    XCTAssertEqual(3, sorted[2].hoge.order);
    
    NSMutableArray *arraya = nil;
    [arraya objectAtIndex:0];
}

@end
