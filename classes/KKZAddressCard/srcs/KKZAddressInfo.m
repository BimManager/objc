/*	KKZAddressInfo.h
	Copyright (c) 1992-2019, Kirill Kozlov Inc. All rights reserved.
*/

#import "KKZAddressInfo.h"

@implementation KKZAddressInfo

@synthesize country, state, city;
@synthesize zipCode;

- (id)initWithCountry:(NSString *)theCountry
		state:(NSString *)theState
		 city:(NSString *)theCity
	      zipCode:(NSUInteger)theZipCode
{
  if (self = [super init])
    {
      country = [[NSString alloc] initWithString: theCountry];
      state = [[NSString alloc] initWithString: theState];
      city = [[NSString alloc] initWithString: theCity];
      zipCode = theZipCode;
    }
  return (self);
}

- (id)init
{
  return ([self initWithCountry: @"US"
		state: @"California"
		city: @"Fremont"
		zipCode: 54999]);
}

- (void)dealloc
{
  [country release];
  [state release];
  [city release];
  [super dealloc];
}

- (NSString *)description
{
  return ([NSString stringWithFormat:
      @"\nCountry: %@\nState: %@\nCity: %@\nZip Code: %lu\n",
     self.country, self.state, self.city, self.zipCode]);
}

@end
