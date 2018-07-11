//
//  ViewController.m
//  CustomTransition
//
//  Created by huangxiaobin on 11/07/2018.
//  Copyright © 2018 huangxiaobin. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController
- (IBAction)performTransition:(id)sender {
	
	UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, YES, 0);
	[self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
	UIImage *coverImage = UIGraphicsGetImageFromCurrentImageContext();
	
	UIView *coverView = [[UIImageView alloc] initWithImage:coverImage];
	coverView.frame = self.view.bounds;
	[self.view addSubview:coverView];
	
	CGFloat red = arc4random() / (CGFloat)INT_MAX;
	CGFloat green = arc4random() / (CGFloat)INT_MAX;
	CGFloat blue = arc4random() / (CGFloat)INT_MAX;
	self.view.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1];
	
	[UIView animateWithDuration:1 animations:^{
		CGAffineTransform transform = CGAffineTransformMakeScale(0.01, 0.01);
		transform = CGAffineTransformRotate(transform, M_PI_2);
		coverView.transform = transform;
		coverView.alpha = 0.0;
	} completion:^(BOOL finished) {
		[coverView removeFromSuperview];
	}];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
