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

# define ALBUM_ID_KEY @"AlbumAlbumId"
# define ALBUM_NAME_KEY @"AlbumAlbumName"
# define IMAGE_URL_STRING_KEY @"AlbumImageURLString"
# define PRICE_KEY @"AlbumPrice"
# define ITUNES_URL_STRING_KEY @"AlbumITunesURLString"
# define RELEASE_DATE_KEY @"AlbumReleaseDate"
# define GENRE_KEY @"AlbumGenre"
# define ARTIST_KEY @"AlbumArtist"

@interface Album : NSObject <NSCoding>

@property (nonatomic, assign) NSUInteger	albumId;
@property (nonatomic, copy) NSString		*albumName;
@property (nonatomic, copy) NSString		*imageURLString;
@property (nonatomic, copy) NSString		*price;
@property (nonatomic, copy) NSString		*iTunesURLString;
@property (nonatomic, strong)NSDate		*releaseDate;
@property (nonatomic, copy) NSString		*genre;
@property (nonatomic, strong) Artist		*artist;

+ (NSArray *)findAll;
- (BOOL)save;

@end

#endif
