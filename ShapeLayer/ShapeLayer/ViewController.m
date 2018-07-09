//
//  ViewController.m
//  ShapeLayer
//
//  Created by huangxiaobin on 05/07/2018.
//  Copyright © 2018 huangxiaobin. All rights reserved.
//

#import "ViewController.h"
#include "LayerLabel.h"
#import <CoreText/CoreText.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet LayerLabel *layerButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    //[self drawPerson];

    //[self drawRoundedRect];

    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = CGRectMake(0, 0, 200, 300);
    textLayer.position = self.view.layer.position;
    [self.view.layer addSublayer:textLayer];

    textLayer.foregroundColor = [UIColor blackColor].CGColor;
    textLayer.alignmentMode = kCAAlignmentJustified;
    textLayer.wrapped = YES;

    UIFont *font = [UIFont systemFontOfSize:15];

    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFloat fontSize = font.pointSize;
    textLayer.contentsScale = [UIScreen mainScreen].scale;

    CTFontRef fontRef = CTFontCreateWithName(fontName, fontSize, NULL);

    NSString *text = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque massa arcu, eleifend vel varius in, facilisis pulvinar leo. Nunc quis nunc at mauris pharetra condimentum ut ac neque. Nunc \
                     elementum, libero ut porttitor dictum, diam odio congue lacus, vel fringilla sapien diam at purus. Etiam suscipit pretium nunc sit amet lobortis";

    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:text];

    NSDictionary *attribus = @{
            (__bridge id)kCTForegroundColorAttributeName: (__bridge id)[UIColor blackColor].CGColor,
            (__bridge id)kCTFontAttributeName: (__bridge id)fontRef
    };

    [string setAttributes:attribus range:NSMakeRange(0, [text length])];

    attribus = @{
            (__bridge id)kCTForegroundColorAttributeName: (__bridge id)[UIColor redColor].CGColor,
            (__bridge id)kCTUnderlineStyleAttributeName: @(kCTUnderlineStyleSingle),
            (__bridge id)kCTFontAttributeName: (__bridge id)fontRef
    };
    [string setAttributes:attribus range:NSMakeRange(6, 5)];

    //textLayer.string = string;

    //set layer label

    self.layerButton.textColor = [UIColor redColor];
    self.layerButton.text = @"Layer layer";
}

- (void)drawRoundedRect {
    CGRect rect = CGRectMake(100, 100, 200, 200);
    CGSize radii = CGSizeMake(20, 20);

    UIRectCorner corners = UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight;

    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:radii];

    CAShapeLayer *shape = [CAShapeLayer layer];
    shape.fillColor = [UIColor clearColor].CGColor;
    shape.strokeColor = [UIColor redColor].CGColor;
    shape.lineCap = kCALineCapRound;
    shape.lineJoin = kCALineJoinRound;
    shape.lineWidth = 5;

    shape.path = path.CGPath;

    [self.view.layer addSublayer:shape];
}

- (void)drawPerson {
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(175, 100)];
    [path addArcWithCenter:CGPointMake(150, 100)
                    radius:25
                startAngle:0
                  endAngle:M_PI * 2
                 clockwise:YES];

    [path moveToPoint:CGPointMake(150, 125)];
    [path addLineToPoint:CGPointMake(150, 175)];
    [path moveToPoint:CGPointMake(150, 175)];
    [path addLineToPoint:CGPointMake(125, 225)];
    [path moveToPoint:CGPointMake(150, 175)];
    [path addLineToPoint:CGPointMake(175, 225)];
    [path moveToPoint:CGPointMake(100, 150)];
    [path addLineToPoint:CGPointMake(200, 150)];


    CAShapeLayer *shape = [CAShapeLayer layer];
    shape.fillColor = [UIColor clearColor].CGColor;
    shape.strokeColor = [UIColor redColor].CGColor;
    shape.lineCap = kCALineCapRound;
    shape.lineJoin = kCALineJoinRound;
    shape.lineWidth = 5;

    shape.path = path.CGPath;

    [self.view.layer addSublayer:shape];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
