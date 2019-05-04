/*
 *	ViewController.m
 *	Autolayout
 *	Created by Kirill Kozlov on 4/22/19
 *	Copyright 2019 Kirill Kozlov. All rights reserved.
 */

#import "MainViewController.h"

@implementation MainViewController

@synthesize ch31button = _ch31button;
@synthesize ch32button = _ch32button;

- (void)loadView
{
  [super loadView];
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor redColor];
  self.ch31button = [UIButton buttonWithType:UIButtonTypeSystem];
  [self.ch31button setTitle:@"Chapter 3.1" forState:UIControlStateNormal];
  /*  [self.ch31button sizeToFit];
      self.ch31button.center = self.view.center;*/
  [self.ch31button setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self.view addSubview:self.ch31button];
  [self centerButton:self.ch31button];
  [self.ch31button addTarget:self
	action:@selector(onClickedch31Button:)
	forControlEvents:UIControlEventTouchUpInside];
}

- (void)onClickedch31Button:(id)sender
{
  id	viewCtrl;
  
  viewCtrl = [[Ch31ViewController alloc] init];
  [self presentViewController:viewCtrl animated:YES completion:NULL];
  [viewCtrl release];
}

- (void)dealloc
{
  [_ch31button release];
  [_ch32button release];
  [super dealloc];
}

- (void)centerButton:(UIButton *)button
{
  //NSDictionary	*views;
  //NSArray	*constraints;
  NSLayoutConstraint	*hozConst;
  NSLayoutConstraint	*verConst;

  [button setFrame:CGRectMake(0, 0 , 100.f, 100.f)];
  /* 1. setTranslatesAutoresizingMaskIntoConstraints:NO */
  //  [button setTranslatesAutoresizingMaskIntoConstraints:NO];
  /* 2. call NSDictionaryOfVariableBindinds() */
  //views = NSDictionaryOfVariableBindings(button);
  /* 3. [NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:] */
  /* 3. [NSLayoutConstraint */
  /*  constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constatnt:] */
  /*constraints = [NSLayoutConstraint
		  constraintsWithVisualFormat:@"H:|-20-[button]-20-|"
		  options:0
		  metrics:nil
		  views:views];*/
  hozConst = [NSLayoutConstraint
		    constraintWithItem:button
		    attribute:NSLayoutAttributeCenterX
		    relatedBy:NSLayoutRelationEqual
		    toItem:button.superview
		    attribute:NSLayoutAttributeCenterX
		    multiplier:1.0f
		    constant:0.0f];
  /* 4. [NSLayoutConstraint activateConstraints:] */
  //[NSLayoutConstraint activateConstraint:hozConst];
  hozConst.active = YES;
  //  [NSLayoutConstraint activateConstraints:constraints];
  /* 5. [superview addConstraints:] */
  [button.superview addConstraint:hozConst];
  [button.superview setNeedsUpdateConstraints];
  NSLog(@"main view's constraints:\n%@", [button.superview constraints]);
}

@end
