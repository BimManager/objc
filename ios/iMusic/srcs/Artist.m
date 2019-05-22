/*
 *	Artist.m
 *	iMusic
 *	Created by Kirill Kozlov on 4/22/19
 *	Copyright 2019 Kirill Kozlov. All rights reserved.
 */

#import "Artist.h"

@implementation Artist

@synthesize artistId = _artistId;
@synthesize artistName = _artistName;

- (id)initWithId:(NSUInteger)id name:(NSString *)name
{
  if ((self = [super init]))
    {
      _artistId = id;
      _artistName = [name copy];
    }
  return (self);
}

+ (id)artistWithId:(NSUInteger)id name:(NSString *)name
{
  Artist	*artist;

  artist = [[Artist alloc] initWithId:id name:name];
  return ([artist autorelease]);
}

/* NSCoding protocol adoption */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
  [aCoder encodeInteger:_artistId
	  forKey:ARTIST_ID_KEY];
  [aCoder encodeObject:_artistName
	  forKey:ARTIST_NAME_KEY];
}

- (id)initWithCoder:(NSCoder *)aCoder
{
  _artistId = [aCoder decodeIntegerForKey:ARTIST_ID_KEY];
  _artistName = [aCoder decodeObjectForKey:ARTIST_NAME_KEY];
  return (self);
}

- (NSString *)description
{
  return ([NSString stringWithFormat:@"%lu - %@", self.artistId, self.artistName]);
}

- (void)dealloc
{
  [_artistName release];
  [super dealloc];
}

@end



