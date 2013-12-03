//
//  VPTransitionDelegate.m
//  VPModalViewControllerTransitions
//
//  Created by Vidu Pirathaparajah on 03/12/13.
//  Copyright (c) 2013 Vidu Pirathaparajah. All rights reserved.
//

#import "VPTransitionDelegate.h"
#import "VPTransitionAnimator.h"

@implementation VPTransitionDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [[VPTransitionAnimator alloc] init];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[VPTransitionAnimator alloc] init];;
}

@end
