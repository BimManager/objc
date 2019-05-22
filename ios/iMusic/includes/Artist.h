/*
 *	Artist.h
 *	iMusic
 *	Created by Kirill Kozlov on 4/22/19
 *	Copyright 2019 Kirill Kozlov. All rights reserved.
 */

#ifndef ARTIST_H
# define ARTIST_H

# import <UIKit/UIKit.h>

# define ARTIST_ID_KEY @"ArtistArtistId"
# define ARTIST_NAME_KEY @"ArtistArtistNameKey"

@interface Artist : NSObject <NSCoding>

@property (nonatomic, assign) NSUInteger artistId;
@property (nonatomic, copy) NSString *artistName;

+ (id)artistWithId:(NSUInteger)id name:(NSString *)name;
- (id)initWithId:(NSUInteger)id name:(NSString *)name;

@end

#endif
