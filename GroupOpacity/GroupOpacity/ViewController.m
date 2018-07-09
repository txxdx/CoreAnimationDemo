//
//  ViewController.m
//  GroupOpacity
//
//  Created by huangxiaobin on 04/07/2018.
//  Copyright © 2018 henry. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(weak, nonatomic) IBOutlet UIButton * button1;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	

	self.button1.layer.cornerRadius = 10;
	
	CGRect frame = CGRectMake(20, 10, 110, 30);
	UILabel *label = [[UILabel alloc] initWithFrame:frame];
	label.text = @"Hello World";
	label.backgroundColor = [UIColor whiteColor];
	label.textAlignment = NSTextAlignmentCenter;
	[self.button1 addSubview:label];
	
	self.button1.alpha = 0.5;
	
	self.button1.layer.shouldRasterize = YES;
	self.button1.layer.rasterizationScale = [UIScreen mainScreen].scale;

}

- (UIButton *)customButton {
	CGRect frame = CGRectMake(0, 0, 150, 50);
	UIButton *button = [[UIButton alloc] initWithFrame:frame];
	button.backgroundColor = [UIColor whiteColor];
	button.layer.cornerRadius = 10;
	
	frame = CGRectMake(20, 10, 110, 30);
	UILabel *label = [[UILabel alloc] initWithFrame:frame];
	label.text = @"Hello World";
	label.backgroundColor = [UIColor whiteColor];
	label.textAlignment = NSTextAlignmentCenter;
	[button addSubview:label];
	
	return button;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
