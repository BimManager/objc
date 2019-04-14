/*	KKZAddressInfo.h
	Copyright (c) 1992-2019, Kirill Kozlov Inc. All rights reserved.
*/

#ifndef KKZ_ADDRESS_INFO_H
# define KKZ_ADDRESS_INFO_H

# import <Foundation/Foundation.h>

@interface KKZAddressInfo : NSObject
{
  NSString	*country;
  NSString	*state;
  NSString	*city;
  NSUInteger	zipCode;
}

@property (copy, nonatomic) NSString *country, *state, *city;
@property NSUInteger zipCode;

- (id)init;
- (void)dealloc;
- (NSString *)description;

- (id)initWithCountry:(NSString *)theCountry
		state:(NSString *)theState
		city:(NSString *)theCity
		zipCode:(NSUInteger)theZipCode;

@end

#endif
