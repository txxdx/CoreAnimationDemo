//
//  ViewController.m
//  GradientLayer
//
//  Created by huangxiaobin on 06/07/2018.
//  Copyright © 2018 huangxiaobin. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    //[self addDiagonalGradient];

    //[self addThreePartGradient];

}

- (void)addThreePartGradient {
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(0, 0, 200, 200);
    gradientLayer.position = self.view.center;
    [self.view.layer addSublayer:gradientLayer];

    gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor,
            (__bridge id)[UIColor yellowColor].CGColor,
            (__bridge id)[UIColor greenColor].CGColor];

    gradientLayer.locations = @[@0, @0.25, @0.5];

    gradientLayer.startPoint = CGPointMake(0, 0.5);
    gradientLayer.endPoint = CGPointMake(1, 0.5);
}

- (void)addDiagonalGradient {
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(0, 0, 200, 200);
    gradientLayer.position = self.view.center;
    [self.view.layer addSublayer:gradientLayer];

    gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor,
            (__bridge id)[UIColor blueColor].CGColor];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 1);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end