//
//  VPModalViewController.m
//  ModalViewControllerTransitions
//
//  Created by Vidu Pirathaparajah on 06/11/13.
//
//

#import "VPModalViewController.h"

@interface VPModalViewController ()
@property (nonatomic,strong) UIImageView *imageView;
@end

@implementation VPModalViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.clipsToBounds = YES;
	[self setupImageView];
}

- (void)setupImageView {
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"modal"]];
    self.imageView.frame = self.view.bounds;
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.imageView];
}

@end
