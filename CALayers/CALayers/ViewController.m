//
//  ViewController.m
//  CALayers
//
//  Created by huangxiaobin on 02/07/2018.
//  Copyright © 2018 henry. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<CALayerDelegate>
@property(nonatomic) UIView *layerView;
@property(nonatomic)CALayer *blueLayer;
@end

@implementation ViewController

- (void)addBlueLayerToHostedLayer {
	self.blueLayer = [CALayer layer];
	self.blueLayer.frame = CGRectMake(50, 50, 100, 100);// frame in supclass
	self.blueLayer.backgroundColor = [UIColor blueColor].CGColor;
	
	[self.layerView.layer addSublayer:self.blueLayer];
	
	self.blueLayer.delegate = self;
	
	[self.blueLayer display];
}

- (void)addSubViewToView {
	self.layerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
	[self.view addSubview:_layerView];
	_layerView.backgroundColor = [UIColor whiteColor];
	_layerView.center = self.view.center;
	
	self.view.backgroundColor = [UIColor grayColor];
}

- (void)addBackingImageToView {
	UIImage *image= [UIImage imageNamed:@"Snowman"];
	self.layerView.layer.contents = (__bridge id _Nullable)(image.CGImage);
	//self.layerView.contentMode = UIViewContentModeScaleAspectFit;
	self.layerView.layer.contentsGravity = kCAGravityCenter;
	self.layerView.layer.contentsScale = image.scale;
	self.layerView.layer.masksToBounds = YES;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	[self addSubViewToView];
	
	[self addBlueLayerToHostedLayer];
	
	//[self addBackingImageToView];
	
	
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
//	CGContextSetLineWidth(ctx, 10);
//	CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
//	CGContextStrokeEllipseInRect(ctx, layer.bounds);
}
- (IBAction)changeColor:(id)sender {
	CGFloat red = arc4random() / (CGFloat)INT_MAX;
	CGFloat green = arc4random() / (CGFloat)INT_MAX;
	CGFloat blue = arc4random() / (CGFloat)INT_MAX;
	
	self.blueLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1].CGColor;

}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
	CGPoint point = [[touches anyObject] locationInView:self.view];
	
	//convert point to white layer's coordinates. Point in self.view layer to point in white layer
	//point = [self.layerView.layer convertPoint:point fromLayer:self.view.layer];
//	point = [self.view.layer convertPoint:point toLayer:self.layerView.layer];
//
//	if ([self.layerView.layer containsPoint:point]){
//		// point in white layer to point in blue layer
//
//		//point = [self.blueLayer convertPoint:point fromLayer:self.layerView.layer];
//		point = [self.layerView.layer convertPoint:point toLayer:self.blueLayer];
//
//		if ([self.blueLayer containsPoint:point]) {
//			NSLog(@"touch in blue layer");
//		} else {
//			NSLog(@"touch in white layer");
//		}
//	}
	
	CALayer *layer = [self.layerView.layer hitTest:point];
	if (layer == self.blueLayer) {
		NSLog(@"inside blue layer");
	} else if (layer == self.layerView.layer) {
		NSLog(@"inside white layer");
	}
}

@end
