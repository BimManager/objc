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



