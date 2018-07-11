//
//  ViewController.m
//  TransitionsAnimation
//
//  Created by huangxiaobin on 10/07/2018.
//  Copyright © 2018 huangxiaobin. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, copy) NSArray *images;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.images = @[[UIImage imageNamed:@"Anchor"], [UIImage imageNamed:@"Cone"], [UIImage imageNamed:@"Igloo"], [UIImage imageNamed:@"Spaceship"]];
}

- (IBAction)changeImage:(id)sender {
//    CATransition *transition = [CATransition animation];
//    transition.type = kCATransitionFade;
//
//    [self.imageView.layer addAnimation:transition forKey:nil];
//
//    UIImage *currentImage = self.imageView.image;
//
//    NSUInteger index = [self.images indexOfObject:currentImage];
//    index = (index + 1) % self.images.count;
//    self.imageView.image = self.images[index];
	
	[UIView transitionWithView:self.imageView duration:1 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
		UIImage *currentImage = self.imageView.image;
		
		NSUInteger index = [self.images indexOfObject:currentImage];
		index = (index + 1) % self.images.count;
		self.imageView.image = self.images[index];
	} completion:NULL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
