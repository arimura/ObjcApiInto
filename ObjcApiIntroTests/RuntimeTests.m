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

@protocol Foo <NSObject>
- (void)bar;
@end

@interface Facade : NSObject<Foo>
@property (nonatomic) id delegate;
@end
@implementation Facade
- (id)forwardingTargetForSelector:(SEL)aSelector{
    return _delegate;
}
- (void)bar {
    NSLog(@"bar!");
}
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

- (void)testSendMessage{
    id obj = @"hoge";
    SEL sel = NSSelectorFromString(@"substringFromIndex:");
    IMP imp = [obj methodForSelector:sel];
    NSString *sub = ((id(*)(id, SEL, NSInteger))imp)(obj,sel,1);
    XCTAssertEqualObjects(@"oge", sub);
}

- (void)testFindClass{
    Class uiview = NSClassFromString(@"UIView");
    if(Nil == uiview) {
        NSLog(@"Not linked");
    }else{
        id view = [UIView new];
        NSLog(@"View: %@", view);
    }
}

- (void)testFacade{
    Facade *facade = [Facade new];
    facade.delegate = [NSMutableArray array];
    [facade performSelector:@selector(addObject:) withObject:@"hoge"];
    XCTAssertEqualObjects(@"hoge", facade.delegate[0]);
    
}

- (void)testCountClass{
    NSMutableArray *classes = [NSMutableArray array];
    int classCount = objc_getClassList(NULL, 0);
    Class *classList = (Class*)calloc(classCount, sizeof(Class));
    objc_getClassList(classList, classCount);
    for (int i = 0; i <classCount; i++){
        [classes addObject:NSStringFromClass(classList[i])];
    }
    free(classList);
    [classes sortedArrayUsingSelector:@selector(compare:)];
    NSLog(@"%@", classes);
}

- (void)testClassTree {
    NSString *className = @"NSString";
    const char *name = [className UTF8String];
    printf("%s \n\tIvars: \n", name);
    Class cls = NSClassFromString(className);
    unsigned int ivarCount;
    Ivar *ivars = class_copyIvarList(cls, &ivarCount);
    for(unsigned int i = 0; i < ivarCount; i++){
        printf("\t\t%s\n", ivar_getName(ivars[i]));
    }
    free(ivars);
    unsigned int methodCount;
    Method *methods = class_copyMethodList(cls, &methodCount);
    printf("%s\n\tMethods:\n", name);
    for (unsigned int i=0; i<methodCount; i++){
        printf("\t\t%s\n",sel_getName(method_getName(methods[i])));
    }
}
@end
