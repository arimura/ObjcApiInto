//
//  NSURLSessionTests.m
//  ObjcApiIntroTests
//
//  Copyright © 2020 hormiga6. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface NSURLSessionTests : XCTestCase

@end

@implementation NSURLSessionTests

-(void)testConfigurationDefaults {
    __auto_type defaut = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSLog(@"timeoutIntervalForRequest: %f", defaut.timeoutIntervalForRequest);
    NSLog(@"timeoutIntervalForResource: %f", defaut.timeoutIntervalForResource);
    NSLog(@"HTTPMaximumConnectionsPerHost: %ld", defaut.HTTPMaximumConnectionsPerHost);
}

- (void)testURLValidity {
    NSURL *url = [NSURL URLWithString:@"https://insight.adsrvr.org/enduser/vast/?t=1&iid=f370869c-04ad-4cbe-ad34-0f347e90266b&crid=jxyqj1za&wp=${AUCTION_PRICE}&aid=4c488a86-fc45-40ea-8bc0-64575a1c71f1&wpc=USD&sfe=1298b928&puid=&tdid=&pid=vjhcyoe&ag=q9zlkyq&adv=ls7m29c&sig=1_ARHDETSWZQACw9GMd6KMaShjLuhRIojcHiWOP1fmKc.&bp=9.2873802616454081538&cf=2033944&fq=0&td_s=939480693&rcats=app-4mg,app-zgp&mcat=&mste=939480693&mfld=2&mssi=None&mfsi=fa11jmz6gl&uhow=35&agsa=&rgco=Japan&rgre=Hokkaido&rgme=&rgci=Sapporo&rgz=001-0021&svbttd=1&dt=Mobile&osf=iOS&os=iOS144&br=WebView&rlangs=ja&mlang=&svpid=10543&did=2102_AOD_PD_r-video_APP_1000_ios_615&rcxt=InApp&lat=43.087500&lon=141.333500&tmpc=11&daid=c160acbb-78b9-42d2-bbff-1efc985bb90d&vp=0&osi=&osv=&sft=2&bx=30&bv=1&mk=Apple&mdl=iPhone&vpb=InterstitialSliderFloating&dc=13&vcc=EB4YHiCsAijcCzIGCAIICggIOgQIAQgCQAFIAVAEiAECoAH3AqgB3gXIAQHQAQPoAQrwAQGAAgOKAgQIAwgGmgIECAUIB6ACAqgCAMACAA..&sv=fluct&pidi=2599&advi=175441&cmpi=1609619&agi=7931170&cridi=17627431&svi=65&cmp=xcqiqpb&ant=1&vrtd=14,15&tsig=xzMVIKsIWlVmDO_JSgsZUR5tccotiX8jYW-UaH2NvN0.&c=MAQ4AUgAUAFYAoABAQ..&dur=ClQKB213cjQyNWoQzxAiEAi6koR0EglkcjI1YWxpa2UiEAjVk4R0EglkcjI1YWxpa2UiEAjmr_l1Egl0dGQxOWFwYWMiEAjNuMN2Egl0dGQxOWFwYWMKMAoMY2hhcmdlLWFsbC0xIiAI____________ARITdHRkX2RhdGFfZXhjbHVzaW9ucwo4Ch5jaGFyZ2UtYWxsR3JhcGVzaG90QnJhbmRTYWZldHkiFgj2__________8BEglncmFwZXNob3QKTAopY2hhcmdlLWFsbE1vYXRWaWV3YWJpbGl0eUF0dGVudGlvbk1ldHJpY3MiHwik__________8BEg5tb2F0LXJlcG9ydGluZyoCCAEKOwofY2hhcmdlLWFsbE5pZWxzZW5EQVJNZWFzdXJlbWVudCIYCJT__________wESC25pZWxzZW4tZGFyEM8Q&durs=v1mr07&crrelr=&pcm=1&vc=3&said=0a039da3-d6a2-45ee-b5f4-70ff49c64d1b.CAF&ict=WiFi&auct=3&im=1&mc=4979577a-eb0a-47ff-86ff-841f8f4cf529"];
    //{}がURLに利用不可
    XCTAssertNil(url);
   
}

@end
