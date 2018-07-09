//
//  ViewController.m
//  AnalogClock
//
//  Created by huangxiaobin on 02/07/2018.
//  Copyright © 2018 henry. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
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
	
	[self tick];
}

- (void)tick {
	
	NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
	NSUInteger units = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
	NSDateComponents *components = [calendar components:units fromDate:[NSDate date]];
	
	CGFloat hoursAngle = (components.hour / 12.0) * M_PI * 2;
	CGFloat minutesAngle = (components.minute / 60.0) * M_PI * 2;
	CGFloat secondsAngle = (components.second / 60.0) * M_PI * 2;
	
	self.hourHand.transform = CGAffineTransformMakeRotation(hoursAngle);
	self.minuteHand.transform = CGAffineTransformMakeRotation(minutesAngle);
	self.secondHand.transform = CGAffineTransformMakeRotation(secondsAngle);
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
