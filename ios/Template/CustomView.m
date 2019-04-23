/*
 *	CustomView.m
 *	MyApp
 *	Created by Kirill Kozlov on 4/22/19
 *	Copyright 2019 Kirill Kozlov. All rights reserved.
 */

#import "CustomView.h"

@implementation CustomView

@synthesize button = _button;
@synthesize width = _width;
@synthesize height = _height;

- (id)initWithFrame:(CGRect)frame
{
  if ((self = [super initWithFrame: frame]))
    {
      self.button = [UIButton buttonWithType: UIButtonTypeRoundedRect];
      [self.button setTitle: @"Click me!" forState: UIControlStateNormal];
      [self.button setBackgroundColor: [UIColor whiteColor]];
      [self addSubview: self.button];
      //      [self.button addTarget:@selector(onButtonClick:) forControlEvent:UIControlEventTouchUpInside];
    }
  return (self);
}

/*- (id)init
{
  self = [self initWithFrame: [[UIScreen mainScreen] bounds]];
  return (self);
  }*/

-(void)onButtonClick:(UIEvent *)event
{
  [UIView animateWithDuration: 1.0 animations: ^ {
      int buttonY = self.button.frame.origin.y;
      if (!buttonY)
	{
	  self.button.frame = CGRectMake(0, self.height, self.width,
				    self.height);
	  [self.button setBackgroundColor: [UIColor redColor]];
	}
      else if (buttonY == self.height)
	{
	  self.button.frame = CGRectMake(0, 0,
		self.width, self.height);
	  [self.button setBackgroundColor: [UIColor greenColor]];
	}
    }];
}

- (void)drawRect:(CGRect)rect
{
  self.width = self.bounds.size.width;
  self.height = self.bounds.size.height / 2;
  self.button.frame = CGRectMake(0, 0, self.width, self.height);
}
@end
