/*
 *	AboutViewController.m
 *	iMusic
 *	Created by Kirill Kozlov on 5/9/2019
 *	Copyright 2019 Kirill Kozlov. All rights reserved.
 */

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

//@synthesize dismissNavigationItem = _dismissNavigationItem;
@synthesize aboutNavigationBar = _aboutNavigationBar;

- (void)loadView
{
  [super loadView];
}

- (void)viewDidLoad
{
  [self.view setBackgroundColor:[UIColor whiteColor]];

  [self setupNavigationBar];

}

/* - (void)viewWillAppear:(BOOL) */
/* - (void)viewDidAppear */
/* - (void)viewWillLayoutSubviews */
/* - (void)viewDidLayoutSubviews */
/* - (void)viewWillDisappear:(BOOL) */
/* - (void)viewDidDisappear */
/* - (void)viewDidUnload */

- (void)didReceiveMemoryWarning
{
  NSLog(@"Memory warning!");
}

- (void)dealloc
{
  //  [_dismissNavigationItem release];
  [_aboutNavigationBar release];
  [super dealloc];
}

/*
 * How to set up a standalone UINavigationBar
 * 1. Create a UIBarButtonItem object.
 * 2. Create a UINavigationItem object.
 * 3. Set the button to the navigation item.
 * 4. Generate a UINavigationBar object.
 * 5. Add the navigation item to the bar
 * 6. Add the navigation bar to its superview
 * 7. Constrain the navigation bar
 */
- (void)setupNavigationBar
{
  UIBarButtonItem	*aButton;
  UINavigationItem	*aNavItem;
  UINavigationBar	*aNavBar;

  aButton = [[UIBarButtonItem alloc] 
	   initWithBarButtonSystemItem:UIBarButtonSystemItemDone
	   target:self
	   action:@selector(onClickedDoneButton:)];
  aNavItem = [[UINavigationItem alloc]
	       initWithTitle:@"About"];
  [aNavItem setRightBarButtonItem:aButton
	    animated:YES];
  [aButton release];
  aNavBar = [[UINavigationBar alloc] init];
  aNavBar.items = @[aNavItem];
  [self.view addSubview:aNavBar];
  [aNavBar setTranslatesAutoresizingMaskIntoConstraints:NO];
  [aNavBar.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
  [aNavBar.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
  [aNavBar.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
  [aNavItem release];
  [aNavBar release];
}

- (void)onClickedDoneButton:(id)sender
{
  [self dismissViewControllerAnimated:YES completion:nil];
}

@end
