/*
 *	ViewController.m
 *	MyApp
 *	Created by Kirill Kozlov on 4/22/19
 *	Copyright 2019 Kirill Kozlov. All rights reserved.
 */

#import "ViewController.h"
#import "CustomView.h"

@implementation ViewController

- (void)loadView
{
  CustomView	*customView;

  customView = [[CustomView alloc] init];
  [self setView: customView];
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  CGRect	aRect;
  UILabel	*label;
  
  aRect = CGRectMake(50, 50, 100, 100);
  label = [[UILabel alloc] initWithFrame: aRect];
  label.text = @"Welcome to iOS development.";
  label.textColor = [UIColor redColor];
  label.font = [UIFont fontWithName: @"GillSans-Bold" size: 10];
  label.backgroundColor = [UIColor yellowColor];
  [self.view addSubview: label];
  [label release];
}

@end
