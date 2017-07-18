//
//  UIApiViewController.m
//  ObjcApiIntro
//
//  Copyright © 2017年 hormiga6. All rights reserved.
//

#import "UIApiViewController.h"
#import <stdlib.h>

@interface UIApiViewController ()
@property (weak, nonatomic) IBOutlet UIView *greeView;
@property (weak, nonatomic) IBOutlet UIView *yellowView;
@property (weak, nonatomic) IBOutlet UIView *redView;
@property (nonatomic) UITapGestureRecognizer *tapGestureRecognizer;

@end

@implementation UIApiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapBaseView:)];
    [self.view addGestureRecognizer:self.tapGestureRecognizer];
    
    [self.greeView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapColorView:)]];
    [self.yellowView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapColorView:)]];
    [self.redView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapColorView:)]];
}

- (void)tapBaseView: (UITapGestureRecognizer *) sender {
    if (sender.state == UIGestureRecognizerStateEnded ){
        CGPoint point = [sender locationInView:self.view];
        NSLog(@"%f, %f", point.x, point.y);
    }
}

- (void)tapColorView: (UITapGestureRecognizer *) sender {
    if (sender.state == UIGestureRecognizerStateEnded ){

        CGFloat destY = sender.view.frame.origin.y == 0 ? sender.view.superview.frame.size.height - sender.view.frame.size.height : 0;
        [UIView animateWithDuration:1.5 animations:^{
            CGRect rec = sender.view.frame;
            rec.origin = CGPointMake(sender.view.frame.origin.x, destY);
            sender.view.frame = rec;
        }];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
