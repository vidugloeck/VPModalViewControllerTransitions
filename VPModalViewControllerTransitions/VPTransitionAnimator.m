//
//  VPTransitionAnimator.m
//  VPModalViewControllerTransitions
//
//  Created by Vidu Pirathaparajah on 03/12/13.
//  Copyright (c) 2013 Vidu Pirathaparajah. All rights reserved.
//

#import "VPTransitionAnimator.h"

@implementation VPTransitionAnimator
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.33;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {

    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

    if (fromViewController.presentedViewController == toViewController) {
        [self presentWithTransitionContext:transitionContext];
    } else {
        [self dismissWithTransitionContext:transitionContext];
    }
}

#pragma mark - Private methods

- (void)presentWithTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext {

    UIView *containerView = [transitionContext containerView];

    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

    CGRect endFrame = [transitionContext initialFrameForViewController:fromViewController];

    [containerView addSubview:fromViewController.view];
    [containerView addSubview:toViewController.view];

    fromViewController.view.frame = endFrame;
    toViewController.view.frame = CGRectZero;

    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                     animations:^{
                         toViewController.view.frame = endFrame;
                     } completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)dismissWithTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext {

    UIView *containerView = [transitionContext containerView];

    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

    CGRect endFrame = [transitionContext initialFrameForViewController:fromViewController];

    [containerView addSubview:toViewController.view];
    [containerView addSubview:fromViewController.view];

    fromViewController.view.frame = endFrame;
    toViewController.view.frame = endFrame;

    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                     animations:^{
                         fromViewController.view.frame = CGRectZero;
                     } completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}
@end
