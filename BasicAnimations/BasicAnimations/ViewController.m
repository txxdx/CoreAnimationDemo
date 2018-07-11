//
//  ViewController.m
//  BasicAnimations
//
//  Created by huangxiaobin on 09/07/2018.
//  Copyright © 2018 huangxiaobin. All rights reserved.
//

#import "ViewController.h"


@interface ViewController () <CAAnimationDelegate>
@property (nonatomic) CALayer *colorLayer;

@end

@implementation ViewController
- (IBAction)changeColor:(id)sender {

   CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
   animation.keyPath = @"backgroundColor";
   animation.duration = 2.0;
   animation.values = @[
           (__bridge id)[UIColor blueColor].CGColor,
           (__bridge id)[UIColor redColor].CGColor,
           (__bridge id)[UIColor greenColor].CGColor,
           (__bridge id)[UIColor blueColor].CGColor];

   [self.colorLayer addAnimation:animation forKey:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(50, 50, 100, 100);
    self.colorLayer.backgroundColor = [UIColor blueColor].CGColor;

    [self.view.layer addSublayer:self.colorLayer];
}

- (void)animationDidStop:(CABasicAnimation *)anim finished:(BOOL)flag {
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    self.colorLayer.backgroundColor = (__bridge CGColorRef)anim.toValue;
    [CATransaction commit];
}

- (void)applyBasicAnimation:(CABasicAnimation *)animation toLayer:(CALayer *)layer {
    animation.fromValue = [layer.presentationLayer ?: layer valueForKeyPath:animation.keyPath];

    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    [layer setValue:animation.toValue forKeyPath:animation.keyPath];
    [CATransaction commit];

    [layer addAnimation:animation forKey:nil];
}


@end
