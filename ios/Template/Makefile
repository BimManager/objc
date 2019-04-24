#
#	Makefile
#	PROJECT_NAME
#	Created by Kirill Kozlov on 4/22/19
#	Copyright 2019 Kirill Kozlov. All rights reserved.
#

CC = clang
CFLAGS = \
	-v \
	-x objective-c \
	-arch x86_64 \
	-fno-objc-arc \
	-isysroot /Users/kkozlov/Downloads/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk \
	-miphoneos-version-min=6.0 \
	-I$(INCLUDES) \

LDFLAGS = \
	-isysroot /Users/kkozlov/Downloads/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk \
	-mios-simulator-version-min=6.0 \
	-L$(LIBARCLITE)\
	-larclite_iphonesimulator \
	-F$(FRAMEWORKS) -framework Foundation -framework UIKit -framework CoreGraphics \
	-fobjc-link-runtime \
	-Xlinker -objc_abi_version -Xlinker 2

HDRS = AppDelegate.h ViewController.h 
SRCS = AppDelegate.m ViewController.m main.m
OBJS = AppDelegate.o ViewController.o main.o
NAME = App

XCODE_BASE = /Users/kkozlov/Downloads/Xcode.app/Contents
SIMULATOR_BASE = $(XCODE_BASE)/Developer/Platforms/iPhoneSimulator.platform
FRAMEWORKS = $(SIMULATOR_BASE)/Developer/SDKs/iPhoneSimulator.sdk/System/Library/Frameworks
INCLUDES = $(SIMULATOR_BASE)/Developer/SDKs/iPhoneSimulator.sdk/usr/include
LIBARCLITE = $(XCODE_BASE)/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/arc

all : $(NAME)

$(NAME) : $(OBJS)
	$(CC) $(LDFLAGS) $^ -o ./App.app/$@

$(OBJS) : $(SRCS)
	$(CC) $(CFLAGS) -c $^

.PHONY : all clean fclean re

clean :
	rm -f $(OBJS)

fclean : clean
	rm -f $(NAME)

re : fclean all

#ALLFLAGS = \
	-v \
	-x objective-c \
	-arch x86_64 \
	-fno-objc-arc \
	-isysroot /Users/kkozlov/Downloads/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk \
	-mios-simulator-version-min=6.0 \
	-miphoneos-version-min=6.0 \
	-fobjc-abi-version=2 \
	-I$(INCLUDES) \
	-L$(LIBARCLITE)\
	-larclite_iphonesimulator \
	-F$(FRAMEWORKS) -framework Foundation -framework UIKit -framework CoreGraphics \
	-fobjc-link-runtime \
	-Xlinker -objc_abi_version -Xlinker 2