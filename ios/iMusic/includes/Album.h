/*
 *	Album.h
 *	iMusic
 *	Created by Kirill Kozlov on 4/22/19
 *	Copyright 2019 Kirill Kozlov. All rights reserved.
 */

#ifndef ALBUM_H
# define ALBUM_H

# import <UIKit/UIKit.h>

# import "Artist.h"

@interface Album : NSObject

@property (nonatomic, assign) NSUInteger albumId;
@property (nonatomic, copy) NSString *albumName;
@property (nonatomic, copy) NSString *imageURLString;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *iTunesURLString;
@property (nonatomic, strong)NSDate *releaseDate;
@property (nonatomic, copy) NSString *genre;
@property (nonatomic, strong) Artist *artist;

@end

#endif
