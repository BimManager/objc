/*
 *	Ch31ViewController.m
 *	Autolayout
 *	Created by Kirill Kozlov on 4/22/19
 *	Copyright 2019 Kirill Kozlov. All rights reserved.
 */

#import "Ch31ViewController.h"

@implementation Ch31ViewController

@synthesize dismissButton = _dismissButton;

- (void)loadView
{
  [super loadView];
}

- (void)viewDidLoad
{
  UIView	*aView;

  [super viewDidLoad];
  self.view.backgroundColor = [UIColor grayColor];
  aView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200.0f, 200.0f)];
  [aView setBackgroundColor:[UIColor blueColor]];
  self.dismissButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [self.dismissButton setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self.dismissButton setTitle:@"Back" forState:UIControlStateNormal];
  [self.dismissButton sizeToFit];
  //  [self.view addSubview:self.dismissButton];
  
  [self.view addSubview:aView];
  [aView addSubview:self.dismissButton];
  [self centerButton:self.dismissButton];
  
  [self.dismissButton addTarget:self action:@selector(onClickedDismissButton:)
       forControlEvents:UIControlEventTouchUpInside];
  [aView release];
  NSLog(@"Constraints:\n%@", [self.view constraints]);
}

- (void)onClickedDismissButton:(id)sender
{
  [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)centerButton:(UIButton *)aButton
{
  NSLayoutConstraint	*centerXConstraint;
  NSLayoutConstraint	*centerYConstraint;
  centerXConstraint = 
    [NSLayoutConstraint
      constraintWithItem:aButton
      attribute:NSLayoutAttributeCenterX
      relatedBy:NSLayoutRelationEqual
      toItem:aButton.superview
      attribute:NSLayoutAttributeCenterX
      multiplier:1.0f
      constant:0.0f];
  centerXConstraint.active = YES;
 centerYConstraint = 
    [NSLayoutConstraint
      constraintWithItem:aButton
      attribute:NSLayoutAttributeCenterY
      relatedBy:NSLayoutRelationEqual
      toItem:aButton.superview
      attribute:NSLayoutAttributeCenterY
      multiplier:1.0f
      constant:0.0f];
  centerYConstraint.active = YES;
  [aButton.superview
	  addConstraints:@[centerXConstraint, centerYConstraint]];
  [aButton setTitle:@"BACK" forState:UIControlStateNormal];
}

- (void)dealloc
{
  [_dismissButton release];
  [super dealloc];
}

@end
