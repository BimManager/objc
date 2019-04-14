/*	main.m

*/

#import "KKZAddressInfo.h"
#import "KKZAddressCard.h"
#import "KKZAddressBook.h"

void	addressInfo();

int	main(void)
{
  NSAutoreleasePool	*pool;
  KKZAddressBook	*book1;
  KKZAddressCard	*card1;
  KKZAddressCard	*card2;
  KKZAddressCard	*card3;
  KKZAddressCard	*foundCard;
  NSMutableArray	*matches;

  NSValue		*val;
  char			*s;
  char			*unboxed;

  s = "foo";
  pool = [[NSAutoreleasePool alloc] init];
  book1 = [[KKZAddressBook alloc] init];
  card1 = [[KKZAddressCard alloc] initWithFullName: @"Chris Ford"
				  email: @"cford@42.com"];
  card2 = [[KKZAddressCard alloc] initWithFullName: @"Chris Brown"
				  email: @"cbrown@42.com"]; 
  card3 = [[KKZAddressCard alloc] initWithFullName: @"Michael Jordan"
				  email: @"mjordan@42.com"]; 
  [book1 addCard: card1];
  [book1 addCard: card2];
  [book1 addCard: card3];
  [book1 list];
  NSLog(@"********************************");
  foundCard = [book1 lookup: @"Ford"];
  if (foundCard)
    NSLog(@"foundCard = %@", foundCard);
  NSLog(@"********************************");
  matches = [book1 lookup2: @"chris"];
  if (matches)
    for (KKZAddressCard *card in matches)
      NSLog(@"%@", card);
  [card1 release];
  [book1 release];
  if (matches)
    [matches release];
  val = [NSValue valueWithBytes: &s
		 objCType: @encode(char *)];
  NSLog(@"val = %@", val);
  [val getValue: &unboxed];
  printf("unboxing = %s\n", unboxed);
  [pool drain];
  //  sleep(100);

  addressInfo();
  //  sleep(100);
  return (0);
}

void	addressInfo()
{
  KKZAddressInfo	*info;

  info = [[KKZAddressInfo alloc] init];
  NSLog(@"%@", info);
  sleep(100);
  [info release];
}
