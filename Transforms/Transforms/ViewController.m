//
//  ViewController.m
//  Transforms
//
//  Created by huangxiaobin on 04/07/2018.
//  Copyright © 2018 henry. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *layerView;

@end

@implementation ViewController

- (void)affineTransforms {
	CGAffineTransform transform = CGAffineTransformIdentity;
	
	transform = CGAffineTransformScale(transform, 0.5, 0.5);
	
	transform = CGAffineTransformRotate(transform, M_PI / 6);
	
	transform = CGAffineTransformTranslate(transform, 200, 0);
	self.layerView.layer.affineTransform = transform;
	//	self.layerView.transform = transform;

}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	//[self affineTransforms];
	
	CATransform3D transform = CATransform3DIdentity;
	transform.m34 = - 1.0 / 800.0;
	transform = CATransform3DRotate(transform, M_PI, 0, 1, 0);
	
	self.layerView.layer.transform = transform;
}



@end
