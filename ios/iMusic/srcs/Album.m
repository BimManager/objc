/*
 *	Album.m
 *	iMusic
 *	Created by Kirill Kozlov on 4/22/19
 *	Copyright 2019 Kirill Kozlov. All rights reserved.
 */

#import "Album.h"

@implementation Album

@synthesize albumId = _albumId;
@synthesize albumName = _albumName;
@synthesize imageURLString = _imageURLString;
@synthesize price = _price;
@synthesize iTunesURLString = _iTunesURLString;
@synthesize releaseDate = _releaseDate;
@synthesize genre = _genre;
@synthesize artist = _artist;

- (NSString *)description
{
  return ([NSString stringWithFormat:@"%lu - %@", self.albumId, self.albumName]);
}

- (void)dealloc
{
  [_albumName release];
  [_imageURLString release];
  [_price release];
  [_iTunesURLString release];
  [_releaseDate release];
  [_genre release];
  [_artist release];
  [super dealloc];
}

@end
