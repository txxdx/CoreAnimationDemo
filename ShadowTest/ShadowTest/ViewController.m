//
//  ViewController.m
//  ShadowTest
//
//  Created by huangxiaobin on 03/07/2018.
//  Copyright © 2018 henry. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *layerView1;
@property (weak, nonatomic) IBOutlet UIView *layerView2;
@property (weak, nonatomic) IBOutlet UIView *layerView3;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	self.layerView1.layer.shadowOpacity = 0.5;
	//self.layerView1.layer.shadowColor = [UIColor blueColor].CGColor;
	self.layerView2.layer.shadowOpacity = 0.5;
	self.layerView3.layer.shadowOpacity = 0.5;
	
	CGMutablePathRef squarePath = CGPathCreateMutable();
	CGPathAddRect(squarePath, NULL, self.layerView1.bounds);
	self.layerView1.layer.shadowPath = squarePath;
	CGPathRelease(squarePath);
	
	//self.layerView1.layer.borderWidth = 5;
	
	CGMutablePathRef circlePath = CGPathCreateMutable();
	CGPathAddEllipseInRect(circlePath, NULL, self.layerView2.bounds);
	self.layerView2.layer.shadowPath = circlePath;
	CGPathRelease(circlePath);
	
	
	CALayer *maskLayer = [CALayer layer];
	maskLayer.frame = self.imageView.bounds;
	UIImage *maskImage = [UIImage imageNamed:@"Cone"];
	maskLayer.contents = (__bridge id _Nullable)(maskImage.CGImage);
	
	self.imageView.layer.mask = maskLayer;
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
