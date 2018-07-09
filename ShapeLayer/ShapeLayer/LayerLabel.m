//
// Created by huangxiaobin on 06/07/2018.
// Copyright (c) 2018 ___FULLUSERNAME___. All rights reserved.
//

#import "LayerLabel.h"


@implementation LayerLabel {

}

+ (Class)layerClass {
    return [CATextLayer class];
}

- (CATextLayer *)textLayer {
    return (CATextLayer *)self.layer;
}

- (void) setUp {
    self.text = self.text;
    self.textColor = self.textColor;
    self.font = self.font;

    [self textLayer].alignmentMode = kCAAlignmentJustified;
    [self textLayer].wrapped = YES;

    [self.layer display];
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }

    return self;
}

- (void)awakeFromNib {
	[super awakeFromNib];
    [self setUp];
}

- (void)setText:(NSString *)text {
    super.text = text;
    [self textLayer].string = text;
}

- (void)setTextColor:(UIColor *)textColor {
    super.textColor = textColor;

    [self textLayer].foregroundColor = textColor.CGColor;
}

- (void)setFont:(UIFont *)font {
    super.font = font;

    CFStringRef  fontName = (__bridge CFStringRef)font.fontName;
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
    [self textLayer].font = fontRef;
    [self textLayer].fontSize = font.pointSize;
    CGFontRelease(fontRef);
}
@end
