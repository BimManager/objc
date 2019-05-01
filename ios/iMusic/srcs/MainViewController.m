/*
 *	ViewController.m
 *	iMusic
 *	Created by Kirill Kozlov on 4/22/19
 *	Copyright 2019 Kirill Kozlov. All rights reserved.
 */

#import "MainViewController.h"

@implementation MainViewController

@synthesize viewListButton = _viewListButton, aboutButton = _aboutButton;

- (void)loadView
{
  [super loadView];
  self.view.backgroundColor = [UIColor whiteColor];
  self.viewListButton = [UIButton buttonWithType:UIButtonTypeCustom];
  self.aboutButton = [UIButton buttonWithType:UIButtonTypeCustom];
  [self.viewListButton setTitle:@"View List" forState:UIControlStateNormal];
  [self.aboutButton setTitle:@"About iMusic" forState:UIControlStateNormal];
  [self.viewListButton sizeToFit];
  [self.aboutButton sizeToFit];
  self.viewListButton.center = CGPointMake(self.view.center.x, self.view.center.y * 1.25);
  self.aboutButton.center = CGPointMake(self.view.center.x, self.view.center.y * 1.5);
  self.viewListButton.backgroundColor = [UIColor blueColor];
  self.aboutButton.backgroundColor = [UIColor blueColor];
  [self.view addSubview:self.viewListButton];
  [self.view addSubview:self.aboutButton];
}

- (void)viewDidLoad
{
  [super viewDidLoad];
}

- (void)dealloc
{
  [_viewListButton release];
  [_aboutButton release];
  [super dealloc];
}

@end
