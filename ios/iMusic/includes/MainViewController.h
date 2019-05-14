/*
 *	MainViewController.h
 *	iMusic
 *	Created by Kirill Kozlov on 4/22/19
 *	Copyright 2019 Kirill Kozlov. All rights reserved.
 */

#ifndef MAIN_VIEW_CONTROLLER_H
# define MAIN_VIEW_CONTROLLER_H

# import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

@property (strong, nonatomic) UIImageView *logoView;
@property (strong, nonatomic) UIButton *viewListButton;
@property (strong, nonatomic) UIButton *aboutButton;

- (void)createSubviews;
- (void)constraintSubviews;

- (void)onClickedViewListButton:(id)sender;
- (void)onClickedAboutButton:(id)sender;

@end

#endif
