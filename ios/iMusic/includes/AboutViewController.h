/*
 *	AboutViewController.h
 *	iMusic
 *	Created by Kirill Kozlov on 5/9/19
 *	Copyright 2019 Kirill Kozlov. All rights reserved.
 */

#ifndef ABOUT_VIEW_CONTROLLER_H
# define ABOUT_VIEW_CONTROLLER_H

# import <UIKit/UIKit.h>

@interface AboutViewController : UIViewController

				 //@property (nonatomic, strong) UINavigationItem *dismissNavigationItem;
@property (nonatomic, strong) UINavigationBar *aboutNavigationBar;

- (void)onClickedDoneButton:(id)sender;

@end

#endif
