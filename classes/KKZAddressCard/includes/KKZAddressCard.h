/*	KKZAddressCard.h
	Copyright (c) 1992-2019, Kirill Kozlov Inc. All rights reserved.
*/

#ifndef KKZ_ADDRESS_CARD_H
# define KKZ_ADDRESS_CARD_H

# import <Foundation/Foundation.h>

@interface KKZAddressCard : NSObject
{
  NSString	*firstName;
  NSString	*lastName;
  NSString	*emailAddress;
}

/* The attribute copy makes a deep copy of the argument. */
/* The attribute nonatomic lays out that the getter      */
/* should not autorelease or retain the the instance     */
/* variable before returning its value.			 */
@property (copy, nonatomic) NSString *fullName, *emailAddress;

- (id)init;
- (void)dealloc;
- (NSString *)description;

- (BOOL)isEqual:(KKZAddressCard *)card;
- (NSComparisonResult)compareNames:(id)other; 

- (id)initWithFullName:(NSString *)fName email:(NSString *)email;

- (void)setFullName:(NSString *)fName;
- (void)setEmail:(NSString *)email;

@end

#endif

