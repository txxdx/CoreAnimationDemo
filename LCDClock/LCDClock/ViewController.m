//
//  ViewController.m
//  LCDClock
//
//  Created by huangxiaobin on 03/07/2018.
//  Copyright © 2018 henry. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *digitViews;
@property (weak, nonatomic) NSTimer * timer;
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	UIImage *digits = [UIImage imageNamed:@"Digits"];
	
	for (UIView *view in self.digitViews) {
		view.layer.contents = (__bridge id)digits.CGImage;
		view.layer.contentsRect = CGRectMake(0, 0, 0.1, 1);
		view.layer.contentsGravity = kCAGravityResizeAspect;
		view.layer.magnificationFilter = kCAFilterNearest;
	}
	
	self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(tick) userInfo:NULL repeats:YES];
	
	[self tick];
}

- (void)tick {
	NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
	NSUInteger units = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
	
	NSDateComponents *components = [calendar components:units fromDate:[NSDate date]];
	
	[self setDigit:components.hour/10 forView:self.digitViews[0]];
	[self setDigit:components.hour%10 forView:self.digitViews[1]];
	
	[self setDigit:components.minute/10 forView:self.digitViews[2]];
	[self setDigit:components.minute%10 forView:self.digitViews[3]];
	
	[self setDigit:components.second/10 forView:self.digitViews[4]];
	[self setDigit:components.second%10 forView:self.digitViews[5]];
	
}

- (void)setDigit:(NSInteger)digit forView:(UIView *)view {
	view.layer.contentsRect = CGRectMake(digit*0.1, 0, 0.1, 1);
	
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
