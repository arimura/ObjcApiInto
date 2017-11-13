//
//  OCMockTests.m
//  ObjcApiIntroTests
//
//  Copyright © 2017年 hormiga6. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

@interface OCMockModelPeson: NSObject
@property (nonatomic) NSString *name;
@property (nonatomic) NSInteger age;
@end
@implementation OCMockModelPeson
- (NSString*)description {
    return [NSString stringWithFormat:@"Person named %@, age is %ld", self.name, self.age];
}
@end

@interface OCMockModelGroup: NSObject
- (void)add:(OCMockModelPeson*)person;
@end

@implementation OCMockModelGroup
- (void)add:(OCMockModelPeson*)person{
}
@end

@interface OCMockTests : XCTestCase
@end

@implementation OCMockTests
- (void) testConstraint {
    OCMockModelPeson *p1 = [OCMockModelPeson new];
    p1.name = @"foo";
    p1.age = 20;
    OCMockModelPeson *p2 = [OCMockModelPeson new];
    p2.name = @"foo";
    p2.age = 20;

    OCMockModelGroup *g = OCMClassMock([OCMockModelGroup class]);

    [g add:p1];

    OCMVerify([g add:[OCMArg checkWithBlock:^BOOL(id obj) {
        return [[obj name] isEqual:@"foo"] && ([obj age] == 20);
    }]]);
    //fail. [OCMArge isEqual] is checking pointer
    //OCMVerify([g add:[OCMArg isEqual:p2]]);
}
@end

