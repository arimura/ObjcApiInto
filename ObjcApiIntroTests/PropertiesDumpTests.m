//
//  PropertiesDumpTests.m
//  ObjcApiIntro
//
//  Copyright © 2017年 hormiga6. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "objc/objc-runtime.h"

@interface PropertiesDumpTests : XCTestCase
- (void)dumpPropeties:(id)obj;
@end

@implementation PropertiesDumpTests

- (void)testDumpProperties {
    [self dumpPropeties:[[UIView alloc] init]];
}

- (void)dumpPropeties:(id)obj {
    unsigned int propertyCount = 0;
    objc_property_t *properties = class_copyPropertyList([obj class], &propertyCount);
    for(int i = 0; i < propertyCount;i++){
        objc_property_t property = properties[i];
        NSString *name = [[NSString alloc]initWithUTF8String:property_getName(property)];
        @try {
            NSLog(@"peroperty %@ value: %@", name, [obj valueForKey:name]);
        } @catch (NSException *exception) {
            NSLog(@"peroerty %@ isn't kv compliant", name);
        }
    }
    free(properties);
}
@end
