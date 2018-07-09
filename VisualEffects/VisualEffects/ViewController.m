//
//  ViewController.m
//  VisualEffects
//
//  Created by huangxiaobin on 03/07/2018.
//  Copyright © 2018 henry. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (weak, nonatomic) IBOutlet UIView *layerView;
@property (weak, nonatomic) IBOutlet UIView *shadowView;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	self.layerView.layer.cornerRadius = 20.0f;
	self.layerView.layer.borderWidth = 5.0f;
	//self.layerView.layer.borderColor = [UIColor greenColor].CGColor;
	
	//drop shadow
	self.shadowView.layer.shadowOpacity = 0.5;
	self.shadowView.layer.shadowOffset = CGSizeMake(0, 5);
	self.shadowView.layer.shadowRadius = 5;
	//self.shadowView.layer.shadowColor = [UIColor redColor].CGColor;
	//self.shadowView.layer.backgroundColor = [UIColor clearColor].CGColor;
	
	self.layerView.layer.masksToBounds = YES;

}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
