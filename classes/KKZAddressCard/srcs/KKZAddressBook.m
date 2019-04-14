/*	KKZAddressBook.m
	Copyright (c) 1992-2019, Kirill Kozlov Inc. All rights reserved.
*/

#import "KKZAddressBook.h"

@implementation KKZAddressBook

- (id)init
{
  return ([self initWithName: @"NoName"]);
}

- (void)dealloc
{
  if (cards)
    [cards release];
  if (bookName)
    [bookName release];
  [super dealloc];
}

- (NSString *)description
{
  return ([NSString stringWithFormat: @"Not emplemented"]);
}

- (id)initWithName:(NSString *)name
{
  if ((self = [super init]))
    {
      bookName = [[NSString alloc] initWithString: name];
      cards = [[NSMutableArray alloc] init];
      return (self);
    }
  return (nil);
}

- (void)addCard:(KKZAddressCard *)card
{
  [cards addObject: card];
}

- (int)entries
{
  return ([cards count]);
}

- (void)list
{
  for (KKZAddressCard *card in cards)
    NSLog(@"%-20s   %-32s", [card.fullName UTF8String], 
	  [card.emailAddress UTF8String]);
}

- (KKZAddressCard *)lookup:(NSString *)name
{
  for (KKZAddressCard *card in cards)
    if (strstr([card.fullName UTF8String], [name UTF8String]))
      return (card);
  return (nil);
}

- (NSMutableArray *)lookup2:(NSString *)name
{
  NSMutableArray	*matches;
  NSUInteger		i;

  matches = [[NSMutableArray alloc] init];
  for (KKZAddressCard *card in cards)
    if (strstr([card.fullName UTF8String], [name UTF8String]))
      [matches addObject: card];
  if ([matches count])
    return (matches);
  [matches release];
  return (nil);
}

- (void)removeCard:(NSString *)name
{
  for (KKZAddressCard *card in cards)
    if ([card.fullName compare: name] == NSOrderedSame)
      [cards removeObject: card];
}

- (void)sort
{
  [cards sortUsingSelector: @selector(compareNames:)];
}

- (void)sortByBlock
{
  [cards sortUsingComparator:
	  ^(id obj1, id obj2) {
      return [obj1 compareNames: obj2];
	}];
}

- (void)sortByPureBlock
{
  [cards sortUsingComparator:
	   ^(id obj1, id obj2) 
	 {
	   return ([[obj2 fullName] compare: [obj1 fullName]]);
	 }];
}

@end
