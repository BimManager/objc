#
#	Makefile
#	PROJECT_NAME
#	Created by Kirill Kozlov on 4/22/19
#	Copyright 2019 Kirill Kozlov. All rights reserved.
#

CC = clang
CFLAGS = \
	-v \
	-g \
	-x objective-c \
	-arch x86_64 \
	-fno-objc-arc \
	-isysroot $(SYS_ROOT) \
	-miphoneos-version-min=6.0 \
	-I$(INCLUDES) \
	-I$(HDRDIR) \
	-DDEBUG=1 

LDFLAGS = \
	-isysroot $(SYS_ROOT) \
	-mios-simulator-version-min=6.0 \
	-L$(LIBARCLITE) \
	-larclite_iphonesimulator \
	-F$(FRAMEWORKS) -framework Foundation -framework UIKit -framework CoreGraphics \
	-fobjc-link-runtime \
	-Xlinker -objc_abi_version -Xlinker 2

HDRS = AppDelegate.h MainViewController.h 
OBJS = $(addprefix $(OBJDIR)/, AppDelegate.o MainViewController.o main.o)
SBS  = $(addprefix ./Base.lproj/, LaunchScreen.storyboard)
NIBS = *.nib
NAME = App


HDRDIR = ./includes
SRCDIR = ./srcs
OBJDIR = ./objs

vpath %.m : ./srcs

SYS_ROOT = /Users/kkozlov/Downloads/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator12.1.sdk
XCODE_BASE = /Users/kkozlov/Downloads/Xcode.app/Contents
SIMULATOR_BASE = $(XCODE_BASE)/Developer/Platforms/iPhoneSimulator.platform
FRAMEWORKS = $(SIMULATOR_BASE)/Developer/SDKs/iPhoneSimulator.sdk/System/Library/Frameworks
INCLUDES = $(SIMULATOR_BASE)/Developer/SDKs/iPhoneSimulator.sdk/usr/include
LIBARCLITE = $(XCODE_BASE)/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/arc
TOOLS = $(XCODE_BASE)/Developer/usr/bin

all : $(NAME) $(NIBS)

$(NAME) : $(OBJS)
	$(CC) $(LDFLAGS) $^ -o ./$@.app/$@

$(OBJDIR)/%.o : %.m
	$(CC) $(CFLAGS) -c $< -o $@

$(NIBS) : $(SBS)
	$(TOOLS)/ibtool $< --compilation-directory $(NAME).app/Base.lproj/

.PHONY : all clean fclean re

clean :
	rm -f $(OBJS)

fclean : clean
	rm -rf ./$(NAME).app/$(NAME) ./$(NAME).app/Base.lproj/LaunchScreen.storyboardc

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

