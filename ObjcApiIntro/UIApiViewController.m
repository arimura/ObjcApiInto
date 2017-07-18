//
//  UIApiViewController.m
//  ObjcApiIntro
//
//  Copyright © 2017年 hormiga6. All rights reserved.
//

#import "UIApiViewController.h"

@interface UIApiViewController ()

@property (nonatomic) UITapGestureRecognizer *tapGestureRecognizer;
@end

@implementation UIApiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];
    [self.view addGestureRecognizer:self.tapGestureRecognizer];
}

- (void)handleTap: (UITapGestureRecognizer *) sender {
    if (sender.state == UIGestureRecognizerStateEnded ){
        CGPoint point = [sender locationInView:self.view];
        NSLog(@"%f, %f", point.x, point.y);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
