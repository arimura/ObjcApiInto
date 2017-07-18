//
//  LayoutSampleView.m
//  ObjcApiIntro
//
//  Copyright © 2017年 hormiga6. All rights reserved.
//

#import "LayoutSampleView.h"

@implementation LayoutSampleView

- (id)initWithCoder:(NSCoder *)aCoder{
    if(self = [super initWithCoder:aCoder]){
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)]];
    }
    return self;
}

- (void)handleTap:(UITapGestureRecognizer*)sender {
    if (sender.state == UIGestureRecognizerStateEnded){
        for (NSLayoutConstraint *constraint in self.constraints) {
            if (constraint.firstAttribute == NSLayoutAttributeHeight && constraint.secondItem == NSLayoutAttributeNotAnAttribute){
                constraint.constant = constraint.constant * 1.2;
            }
            if (constraint.firstAttribute == NSLayoutAttributeWidth && constraint.secondItem == NSLayoutAttributeNotAnAttribute){
                constraint.constant = constraint.constant * 1.2;
            }
        }
    }
}

@end
