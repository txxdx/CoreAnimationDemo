//
//  ViewController.m
//  LayerSprites
//
//  Created by huangxiaobin on 02/07/2018.
//  Copyright © 2018 henry. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *coneView;
@property (weak, nonatomic) IBOutlet UIView *shipView;
@property (weak, nonatomic) IBOutlet UIView *iglooView;
@property (weak, nonatomic) IBOutlet UIView *anchorView;


@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	UIImage *image = [UIImage imageNamed:@"Sprites"];
	
	[self addSpriteImage:image withContentRect:CGRectMake(0, 0, 0.5, 0.5) toLayer:self.iglooView.layer];
	[self addSpriteImage:image withContentRect:CGRectMake(0.5, 0, 0.5, 0.5) toLayer:self.coneView.layer];
	[self addSpriteImage:image withContentRect:CGRectMake(0, 0.5, 0.5, 0.5) toLayer:self.anchorView.layer];
	[self addSpriteImage:image withContentRect:CGRectMake(0.5, 0.5, 0.5, 0.5) toLayer:self.shipView.layer];
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)addSpriteImage:(UIImage *)image withContentRect:(CGRect)rect toLayer:(CALayer *)layer {
	layer.contents = (__bridge id _Nullable)(image.CGImage);
	
	layer.contentsGravity = kCAGravityResizeAspect;
	
	layer.contentsRect = rect;
}


@end
