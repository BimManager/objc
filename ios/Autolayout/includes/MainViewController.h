/*
 *	MainViewController.h
 *	Autolayout
 *	Created by Kirill Kozlov on 4/22/19
 *	Copyright 2019 Kirill Kozlov. All rights reserved.
 */

#ifndef MAIN_VIEW_CONTROLLER_H
# define MAIN_VIEW_CONTROLLER_H

# import <UIKit/UIKit.h>

# import "Ch31ViewController.h"

@interface MainViewController : UIViewController
{
  UIButton	*_ch31button;
  UIButton	*_ch32button;
}

@property (strong, nonatomic) UIButton *ch31button;
@property (strong, nonatomic) UIButton *ch32button;

- (void)onClickedch31Button:(id)sender;
- (void)onClickedch32Button:(id)sender;

@end

#endif
