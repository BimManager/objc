/*
 *	AppDelegate.m
 *	MyApp
 *	Created by Kirill Kozlov on 4/22/19
 *	Copyright 2019 Kirill Kozlov. All rights reserved.
 */

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchingOptions
{
  self.window = [[[UIWindow alloc] initWithFrame: [[UIScreen mainScreen] bounds]] autorelease];
  self.window.rootViewController = [[[MainViewController alloc] init] autorelease];
  [self.window makeKeyAndVisible];
  return (YES);
}

- (void)dealloc
{
  [_window release];
  [super dealloc];
}

@end
