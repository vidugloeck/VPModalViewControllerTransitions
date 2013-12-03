//
//  VPPresentingViewController.m
//  ModalViewControllerTransitions
//
//  Created by Vidu Pirathaparajah on 06/11/13.
//
//

#import "VPPresentingViewController.h"
#import "VPModalViewController.h"

@interface VPPresentingViewController ()
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation VPPresentingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self setupImageView];

    [self.view addGestureRecognizer:self.presentGestureRecognizer];
}

- (void)setupImageView {
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"presenting"]];
    self.imageView.frame = self.view.bounds;
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.imageView];
}


#pragma mark - Present / Dismiss ViewController

- (void)presentGestureRecognizerTapped:(UITapGestureRecognizer *)gestureRecognizer {
    VPModalViewController *modalViewController = [[VPModalViewController alloc] initWithNibName:nil
                                                                                         bundle:nil];
    [modalViewController.view addGestureRecognizer:self.dismissGestureRecognizer];

    [self presentViewController:modalViewController animated:YES completion:NULL];
}

- (void)dismissGestureRecognizerTapped:(UITapGestureRecognizer *)gestureRecognizer {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark - Helper methods

- (UITapGestureRecognizer *)presentGestureRecognizer {
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                        action:@selector(presentGestureRecognizerTapped:)];
    return gestureRecognizer;
}

- (UITapGestureRecognizer *)dismissGestureRecognizer {
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                        action:@selector(dismissGestureRecognizerTapped:)];
    return gestureRecognizer;
}

@end
