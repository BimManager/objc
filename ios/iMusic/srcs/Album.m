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

/* NSCoding Protocol Adoptation */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
  /*  [super encodeWithCoder:aCoder]; */
  [aCoder encodeInteger:self.albumId 
	  forKey:ALBUM_ID_KEY];
  [aCoder encodeObject:self.albumName
	  forKey:ALBUM_NAME_KEY];
  [aCoder encodeObject:self.imageURLString
	  forKey:IMAGE_URL_STRING_KEY];
  [aCoder encodeObject:self.price
	  forKey:PRICE_KEY];
  [aCoder encodeObject:self.iTunesURLString
	  forKey:ITUNES_URL_STRING_KEY];
  [aCoder encodeObject:self.releaseDate
	  forKey:RELEASE_DATE_KEY];
  [aCoder encodeObject:self.genre
	  forKey:GENRE_KEY];
  [aCoder encodeObject:self.artist
	  forKey:ARTIST_KEY];
}

- (id)initWithCoder:(NSCoder *)aCoder
{
  /*  self = [super initWithCoder:aCoder]; */
  self.albumId = [aCoder decodeIntegerForKey:ALBUM_ID_KEY];
  self.albumName = [aCoder decodeObjectForKey:ALBUM_NAME_KEY];
  self.imageURLString = [aCoder decodeObjectForKey:IMAGE_URL_STRING_KEY];
  self.price = [aCoder decodeObjectForKey:PRICE_KEY];
  self.iTunesURLString = [aCoder decodeObjectForKey:ITUNES_URL_STRING_KEY];
  self.releaseDate = [aCoder decodeObjectForKey:RELEASE_DATE_KEY];
  self.genre = [aCoder decodeObjectForKey:GENRE_KEY];
  self.artist = [aCoder decodeObjectForKey:ARTIST_KEY];
  return (self);
}

+ (NSURL *)iMusicDataURL
{
  NSArray	*urls;

  urls = [[NSFileManager defaultManager]
	   URLsForDirectory:NSDocumentDirectory
	   inDomains:NSUserDomainMask];
  return ([[urls lastObject]
	    URLByAppendingPathComponent:@"iMusicData.imusic"]);
}

+ (NSArray *)findAll
{
  NSData	*data;

  data = [NSData dataWithContentsOfURL:[[self class] iMusicDataURL]];
  if (!data)
    return ([NSMutableArray array]);
  return ([NSKeyedUnarchiver unarchiveObjectWithData:data]);
}

- (BOOL)save
{
  NSMutableArray	*albums;
  NSData		*data;

  albums = (NSMutableArray *)[[self class] findAll];
  [albums insertObject:self atIndex:0];
  data = [NSKeyedArchiver archivedDataWithRootObject:albums];
  return ([data writeToURL:[[self class] iMusicDataURL] atomically:YES]);
}

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
