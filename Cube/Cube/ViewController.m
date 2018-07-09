//
//  ViewController.m
//  Cube
//
//  Created by huangxiaobin on 05/07/2018.
//  Copyright © 2018 henry. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *faces;

@end

@implementation ViewController
- (IBAction)buttonClicked:(id)sender {
	NSLog(@"face 3 button clicked.");
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    //[self addCube1];

    CATransform3D pt = CATransform3DIdentity;
    pt.m34 = -1 / 500.0;
    self.view.layer.sublayerTransform = pt;

    CATransform3D c1t = CATransform3DIdentity;
    c1t = CATransform3DTranslate(c1t, 0, -100, 0);
    CALayer *cube1 = [self cubeWithTransform:c1t];
    [self.view.layer addSublayer:cube1];

    CATransform3D c2t = CATransform3DIdentity;
    c2t = CATransform3DTranslate(c2t, 0, 100, 0);
    c2t = CATransform3DRotate(c2t, -M_PI_4, 1, 0, 0);
    c2t = CATransform3DRotate(c2t, -M_PI_4, 0, 1, 0);
    //c2t = CATransform3DRotate(c2t, -M_PI_4, 0, 0, 1);
    CALayer *cube2 = [self cubeWithTransform:c2t];
    [self.view.layer addSublayer:cube2];

}

- (CALayer *)faceWithTransform: (CATransform3D)transform
{
    CALayer *face = [CALayer layer];
    face.frame = CGRectMake(-50, -50, 100, 100);

    CGFloat red = rand() / (double)INT_MAX;
    CGFloat green = rand() / (double)INT_MAX;
    CGFloat blue = rand() / (double)INT_MAX;
    face.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1].CGColor;

    face.transform = transform;

    return face;

}

- (CALayer *)cubeWithTransform:(CATransform3D)transform {
    CATransformLayer *cube = [CATransformLayer layer];

    //face 1
    CATransform3D ct = CATransform3DMakeTranslation(0, 0, 50);
    [cube addSublayer:[self faceWithTransform:ct]];

    //face 2
    ct = CATransform3DMakeTranslation(50, 0, 0);
    ct = CATransform3DRotate(ct, M_PI_2, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:ct]];

    //face 3
    ct = CATransform3DMakeTranslation(0, -50, 0);
    ct = CATransform3DRotate(ct, M_PI_2, 1, 0, 0);
    [cube addSublayer:[self faceWithTransform:ct]];

    //face 4
    ct = CATransform3DMakeTranslation(0, 50, 0);
    ct = CATransform3DRotate(ct, -M_PI_2, 1, 0, 0);
    [cube addSublayer:[self faceWithTransform:ct]];

    //face 5
    ct = CATransform3DMakeTranslation(-50, 0, 0);
    ct = CATransform3DRotate(ct, -M_PI_2, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:ct]];

    //face 6
    ct = CATransform3DMakeTranslation(0, 0, -50);
    ct = CATransform3DRotate(ct, M_PI, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:ct]];

    cube.position = self.view.center;

    cube.transform = transform;

    return cube;
}

- (void)addCube1 {
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = -1 / 500.0;
    perspective = CATransform3DRotate(perspective, -M_PI_4, 1, 0, 0);
    perspective = CATransform3DRotate(perspective, -M_PI_4, 0, 1, 0);
    self.view.layer.sublayerTransform = perspective;


    //add face 1
    CATransform3D transform1 = CATransform3DMakeTranslation(0, 0, 100);
    [self addFace:0 withTransform:transform1];

    //add face 2
    CATransform3D transform2 = CATransform3DMakeTranslation(100, 0, 0);
    transform2 = CATransform3DRotate(transform2, M_PI_2, 0, 1, 0);
    [self addFace:1 withTransform:transform2];

    // add face 3
    CATransform3D transform3 = CATransform3DMakeTranslation(0, -100, 0);
    transform3 = CATransform3DRotate(transform3, M_PI_2, 1, 0, 0);
    [self addFace:2 withTransform:transform3];

    // add face 4
    CATransform3D transform4 = CATransform3DMakeTranslation(0, 100, 0);
    transform4 = CATransform3DRotate(transform4, -M_PI_2, 1, 0, 0);
    [self addFace:3 withTransform:transform4];

    // add face 5
    CATransform3D transform5 = CATransform3DMakeTranslation(-100, 0, 0);
    transform5 = CATransform3DRotate(transform5, -M_PI_2, 0, 1, 0);
    [self addFace:4 withTransform:transform5];

    // add face 6
    CATransform3D transform6 = CATransform3DMakeTranslation(0, 0, -100);
    transform6 = CATransform3DRotate(transform6, M_PI, 0, 1, 0);
    [self addFace:5 withTransform:transform6];
}


- (void)addFace: (NSInteger)index withTransform:(CATransform3D)transform {
	UIView *face = self.faces[index];
	[self.view addSubview:face];
	
	face.center = self.view.center;
	
	face.layer.transform = transform;

//	if (index != 2) {
//		face.userInteractionEnabled = NO;
//	}
}




@end
