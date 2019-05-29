//
//  PointViewController.m
//  ObjcApiIntro
//
//  Copyright © 2019年 hormiga6. All rights reserved.
//

#import "PointViewController.h"

@interface PointViewController ()
@property (weak, nonatomic) IBOutlet UIView *grayView;
@end

@implementation PointViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self.grayView addGestureRecognizer:tapRecognizer];
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"grayView width: %f, height: %f", self.grayView.frame.size.width, self.grayView.frame.size.height);
    NSLog(@"baseView width: %f, height: %f", self.view.frame.size.width, self.view.frame.size.height);

}

- (void)handleTap:(UITapGestureRecognizer*) recognizer {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
