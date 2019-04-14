/*	KKZAddressCard.m
	Copyright (c) 1992-2019, Kirill Kozlov Inc. All rights reserved.
*/

#import "KKZAddressCard.h"

@implementation KKZAddressCard

@synthesize fullName, emailAddress;

- (id)init
{
  return ([self initWithFullName: @"Foo" email: @"foo@foo.com"]);
}

- (void)dealloc
{
  if (fullName)
    [fullName release];
  if (emailAddress)
    [emailAddress release];
  [super dealloc];
}

- (NSString *)description
{
  return [NSString stringWithFormat:
     @"\n\nFull Name : %@\nEmail : %@\n\n", fullName, emailAddress];
}

- (BOOL)isEqual:(KKZAddressCard *)card
{
  if ([fullName compare: card.fullName] == YES &&
	[emailAddress compare: card.emailAddress] == YES)
    return (YES);
  return (NO);
}

- (NSComparisonResult)compareNames:(id)other
{
  return ([fullName compare: [other fullName]]);
} 

- (id)initWithFullName:(NSString*)fName
		 email:(NSString*)email
{
  if ((self = [super init]))
    {
      fullName = [[NSString alloc] initWithString: fName];
      emailAddress = [[NSString alloc] initWithString: email];
      return (self);
    }
  return (nil);
}

- (void)setFullName:(NSString *)fName
{
  if (fullName)
    [fullName release];
  fullName = [[NSString alloc] initWithString: fName];
}

- (void)setEmail:(NSString *)email
{
  if (emailAddress)
    [emailAddress release];
  emailAddress = [[NSString alloc] initWithString: email];
}

@end
