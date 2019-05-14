/*
 *	MainViewController.m
 *	iMusic
 *	Created by Kirill Kozlov on 4/22/19
 *	Copyright 2019 Kirill Kozlov. All rights reserved.
 */

#import "MainViewController.h"
#import "MusicListViewController.h"
#import "AboutViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize logoView = _logoView;
@synthesize viewListButton = _viewListButton, aboutButton = _aboutButton;

- (void)loadView
{
  [super loadView];
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self setTitle:@"iMusic"];
  [self.view setBackgroundColor:[UIColor whiteColor]];
  [self createSubviews];
  [self constraintSubviews];
  NSLog(@"%@", [self.view constraints]);
}

- (void)dealloc
{
  [_logoView release];
  [_viewListButton release];
  [_aboutButton release];
  [super dealloc];

}

- (void)onClickedViewListButton:(id)sender
{
  id	controller;

  controller = [[MusicListViewController alloc] initWithStyle:UITableViewStylePlain];
  [self.navigationController pushViewController:controller animated:YES];
  [controller release];
}

- (void)onClickedAboutButton:(id)sender
{
  id	controller;

  controller = [[AboutViewController alloc] init];
  [self presentViewController:controller
	animated:YES
	completion:nil];
  [controller release];
}

- (void)createSubviews
{
  self.logoView = [[[UIImageView alloc] init] autorelease];
  self.viewListButton = [UIButton buttonWithType:UIButtonTypeSystem];
  self.aboutButton = [UIButton buttonWithType:UIButtonTypeSystem];

  self.logoView.image = [UIImage imageNamed:@"logo"];
  [self.viewListButton setTitle:@"View List" forState:UIControlStateNormal];
  self.viewListButton.backgroundColor = [UIColor grayColor];
  [self.aboutButton setTitle:@"About iMusic" forState:UIControlStateNormal];
  self.aboutButton.backgroundColor = [UIColor grayColor];
  
  [self.viewListButton 
       addTarget:self
       action:@selector(onClickedViewListButton:)
       forControlEvents:UIControlEventTouchUpInside];

  [self.aboutButton
       addTarget:self
       action:@selector(onClickedAboutButton:)
       forControlEvents:UIControlEventTouchUpInside];

  [self.view addSubview:self.logoView];
  [self.view addSubview:self.viewListButton];
  [self.view addSubview:self.aboutButton];
}

- (void)constraintSubviews
{
  NSDictionary	*views;
  NSArray	*constraints;

  [_logoView setTranslatesAutoresizingMaskIntoConstraints:NO];
  [_viewListButton setTranslatesAutoresizingMaskIntoConstraints:NO];
  [_aboutButton setTranslatesAutoresizingMaskIntoConstraints:NO];

  views = NSDictionaryOfVariableBindings(_viewListButton, _aboutButton, _logoView);

  constraints = [NSLayoutConstraint
		  constraintsWithVisualFormat:
		    @"V:|-75-[_logoView(==150)]-50-[_viewListButton]-50-[_aboutButton(==_viewListButton)]-100-|"
		  options:0
		  metrics:nil
		  views:views];
  [NSLayoutConstraint activateConstraints:constraints];
  [self.view addConstraints:constraints];

  constraints = [NSLayoutConstraint
		  constraintsWithVisualFormat:@"H:|-50-[_logoView]-50-|"
		  options:0
		  metrics:nil
		  views:views];
  [NSLayoutConstraint activateConstraints:constraints];
  [self.view addConstraints:constraints];  

  constraints = [NSLayoutConstraint
		  constraintsWithVisualFormat:@"H:|-75-[_viewListButton]-75-|"
		  options:0
		  metrics:nil
		  views:views];
  [NSLayoutConstraint activateConstraints:constraints];
  [self.view addConstraints:constraints];

  constraints = [NSLayoutConstraint
		  constraintsWithVisualFormat:@"H:[_aboutButton(==_viewListButton)]-75-|"
		  options:0
		  metrics:nil
		  views:views];
  [NSLayoutConstraint activateConstraints:constraints];
  [self.view addConstraints:constraints];
}

@end
