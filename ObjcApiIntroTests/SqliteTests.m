//
//  SqliteTests.m
//  ObjcApiIntroTests
//
//  Copyright © 2018年 hormiga6. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "sqlite3.h"

static sqlite3 *db;

static int callback(void *NotUsed, int argc, char **argv, char **azColName){
    int i;
    for(i=0;i<argc;i++){
        printf("sqlite: %s = %s\n", azColName[i], argv[i]? argv[i] : "NULL");
    }
    printf("\n");
    return 0;
}

static char *zErrrMsg = 0;

@interface SqliteTests : XCTestCase
@end

@implementation SqliteTests

- (void)setUp {
    [super setUp];
    NSString *dbPath = [[NSBundle mainBundle] pathForResource:@"test-db" ofType:@"sqlite3"];
    int rc;
    rc = sqlite3_open([dbPath UTF8String], &db);
    if(rc != SQLITE_OK){
        NSLog(@"can't open db.");
        return;
    }
    rc = sqlite3_exec(db, "DROP TABLE IF EXISTS test; CREATE TABLE test (id integer, data text);", callback, 0, &zErrrMsg);
    if (rc != SQLITE_OK){
        printf("SQL error: %s\n", zErrrMsg);
        return;
    }
    
    rc = sqlite3_exec(db, "INSERT INTO test(id, data) VALUES(1, \"hoge\")", callback, 0, &zErrrMsg);
    if(rc != SQLITE_OK){
        printf("SQL error: %s\n", zErrrMsg);
        return;
    }
}

- (void)tearDown {
    [super tearDown];
    sqlite3_close(db);
}

- (void)testSelectWithCallback {
    int rc;
    rc = sqlite3_exec(db, "SELECT * FROM test", callback, 0, &zErrrMsg);
    if(rc != SQLITE_OK){
        printf("SQL error: %s\n", zErrrMsg);
        XCTFail();
    }
}

- (void)testSelectWithStep{
    sqlite3_stmt *stmt;
    int rc;
    rc = sqlite3_prepare(db, "SELECT * FROM test", -1, &stmt, NULL);
    if(rc != SQLITE_OK){
        printf("SQL error: %s\n", zErrrMsg);
        XCTFail();
    }
    
    while ((rc = sqlite3_step(stmt)) == SQLITE_ROW ){
        printf("id: %d, data: %s\n", sqlite3_column_int(stmt, 0), sqlite3_column_text(stmt, 1));
    }
    sqlite3_finalize(stmt);
}
@end
