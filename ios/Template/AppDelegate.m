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
  self.window = [[UIWindow alloc] initWithFrame: [[UIScreen mainScreen] bounds]];
  [self.window makeKeyAndVisible];
  self.window.rootViewController = [[ViewController alloc] init];
  return (YES);
}

@end
