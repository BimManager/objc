/*
 *	Ch31ViewController.h
 *	Autolayout
 *	Created by Kirill Kozlov on 4/22/19
 *	Copyright 2019 Kirill Kozlov. All rights reserved.
 */

#ifndef CH31_VIEW_CONTROLLER_H
# define CH31_VIEW_CONTROLLER_H

# import <UIKit/UIKit.h>

@interface Ch31ViewController : UIViewController
{
  UIButton	*_dismissButton;
}

@property (strong, nonatomic) UIButton *dismissButton;

- (void)onClickedDismissButton:(id)sender;
- (void)centerButton:(UIButton *)aButton;

@end

#endif
