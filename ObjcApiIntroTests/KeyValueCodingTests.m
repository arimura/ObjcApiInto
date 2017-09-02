//
//  KeyValueCodingTests.m
//  ObjcApiIntro
//
//  Copyright © 2017年 hormiga6. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface Person : NSObject
@property (nonatomic) NSString *name;
@end

@implementation Person
@end

@interface Transaction : NSObject
@property (nonatomic) NSNumber *amount;
@end

@implementation Transaction
@end

@interface BankAccount : NSObject
@property (nonatomic) NSNumber *currentBalance;
@property (nonatomic) Person *person;
@property (nonatomic) NSArray<Transaction*> *transactions;
@end

@implementation BankAccount
@end


@interface KeyValueCodingTests : XCTestCase
@end

@implementation KeyValueCodingTests{
    BankAccount *_bankAccount;
}

- (void)setUp{
    _bankAccount = [[BankAccount alloc]init];
    Person *person = [[Person alloc] init];
    person.name = @"hoge";
    _bankAccount.person = person;
    Transaction *tran = [[Transaction alloc] init];
    tran.amount = @(50);
    _bankAccount.transactions = @[tran];
}

- (void)testSetValue {
    [_bankAccount setValue:@(100) forKey:@"currentBalance"];
    XCTAssertEqual(@(100), [_bankAccount currentBalance]);
}

- (void) testSetValutByKeyPatg {
    [_bankAccount setValue:@"fuga" forKeyPath:@"person.name"];
    XCTAssertEqual(@"fuga", _bankAccount.person.name);
}

- (void)testGetTransactionsAmount{
   id val = [_bankAccount valueForKeyPath:@"transactions.amount"];
   XCTAssertTrue([val isKindOfClass:[NSArray class]]);
}
@end
