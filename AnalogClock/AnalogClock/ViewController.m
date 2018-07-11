//
//  ViewController.m
//  AnalogClock
//
//  Created by huangxiaobin on 02/07/2018.
//  Copyright © 2018 henry. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <CAAnimationDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *hourHand;
@property (weak, nonatomic) IBOutlet UIImageView *minuteHand;
@property (weak, nonatomic) IBOutlet UIImageView *secondHand;
@property (weak, nonatomic) NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(tick) userInfo:nil repeats:YES];
	
	self.secondHand.layer.anchorPoint = CGPointMake(0.5, 0.9);
	self.minuteHand.layer.anchorPoint = CGPointMake(0.5, 0.9);
	self.hourHand.layer.anchorPoint = CGPointMake(0.5, 0.9);
	
	//[self tick];
	[self updateHandsAnimated:NO];
}

- (void)tick {
	[self updateHandsAnimated:YES];
}

- (void)updateHandsAnimated:(BOOL)animated {
	
	NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
	NSUInteger units = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
	NSDateComponents *components = [calendar components:units fromDate:[NSDate date]];
	
	CGFloat hoursAngle = (components.hour / 12.0) * M_PI * 2;
	CGFloat minutesAngle = (components.minute / 60.0) * M_PI * 2;
	CGFloat secondsAngle = (components.second / 60.0) * M_PI * 2;
	
	[self setAngle:hoursAngle forHand:self.hourHand animated: animated];
	[self setAngle:minutesAngle forHand:self.minuteHand animated:animated];
	[self setAngle:secondsAngle forHand:self.secondHand animated:animated];
}

- (void)setAngle:(CGFloat)angle forHand:(UIView *)handView animated:(BOOL)animated {
	CATransform3D transform = CATransform3DMakeRotation(angle, 0, 0, 1);
	if (animated) {
		CABasicAnimation *animation = [CABasicAnimation animation];
		animation.keyPath = @"transform";
		animation.toValue = [NSValue valueWithCATransform3D:transform];
		animation.duration = 0.5;
		animation.delegate = self;
		[animation setValue:handView forKey:@"handView"];
		[handView.layer addAnimation:animation forKey:nil];
	} else {
		handView.layer.transform = transform;
	}
}

- (void)animationDidStop:(CABasicAnimation *)anim finished:(BOOL)flag {
	UIView *handView = [anim valueForKey:@"handView"];
	handView.layer.transform = [anim.toValue CATransform3DValue];
}

@end
