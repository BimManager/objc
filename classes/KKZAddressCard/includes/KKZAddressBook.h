/*	KKZAddressBook.h
	Copyright (c) 1992-2019, Kirill Kozlov Inc. All rights reserved.
*/

#ifndef KKZ_ADDRESS_BOOK_H
# define KKZ_ADDRESS_BOOK_H

# import <Foundation/Foundation.h>

# import "KKZAddressCard.h"

@interface KKZAddressBook : NSObject
{
  NSString		*bookName;
  NSMutableArray	*cards; 
}

- (id)init;
- (void)dealloc;
- (NSString *)description;

- (id)initWithName:(NSString *)name;
/* - (id)initWithCard:(KKZAddressCard *)card; */

- (void)addCard:(KKZAddressCard *)card;
- (void)removeCard:(NSString *)name;
- (int)entries;
- (void)list;
- (KKZAddressCard *)lookup:(NSString *)name;
- (NSMutableArray *)lookup2:(NSString *)name;
- (void)sort;
- (void)sortByBlock;
- (void)sortByPureBlock;

@end

#endif


