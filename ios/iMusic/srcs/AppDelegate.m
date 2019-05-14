/*
 *	AppDelegate.m
 *	iMusic
 *	Created by Kirill Kozlov on 4/22/19
 *	Copyright 2019 Kirill Kozlov. All rights reserved.
 */

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchingOptions
{
  id	controller;
  id	navController;

  self.window = [[[UIWindow alloc] initWithFrame: [[UIScreen mainScreen] bounds]] autorelease];
  controller = [[MainViewController alloc] init];
  navController = [[UINavigationController alloc] initWithRootViewController:controller];
  self.window.rootViewController = navController;
  [controller release];
  [navController release];
  [self.window makeKeyAndVisible];
  return (YES);
}

- (void)dealloc
{
  [_window release];
  [super dealloc];
}

@end
