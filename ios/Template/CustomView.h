/*
 *	CustomView.h
 *	MyApp
 *	Created by Kirill Kozlov on 4/22/19
 *	Copyright 2019 Kirill Kozlov. All rights reserved.
 */

#import <UIKit/UIKit.h>

@interface CustomView : UIView
{
  UIButton	*_button;
  int		_width;
  int		_height;
}

@property (strong, nonatomic) UIButton *button;
@property (nonatomic) int width, height;

@end
