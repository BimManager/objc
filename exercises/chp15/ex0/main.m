#if 0
main.m
Exercises chapter 15
#endif

#define SUCCESS	0
#define ERROR	1
#define SEC_PER_DAY 3600

#include <stdlib.h>

#import <Foundation/Foundation.h>

/* A new category */
@interface NSDate (ElapsedDays)

- (unsigned long)elapsedDays:(NSDate *)theDate;

@end

@implementation NSDate (ElapsedDays)

- (unsigned long)elapsedDays:(NSDate *)theDate
{
  unsigned long		ret;
  NSTimeInterval	interval;
  
  interval = [theDate timeIntervalSinceDate: self];
#ifdef DEBUG
  printf("interval = %f\n", interval);
#endif  
  if (interval >= 0)
    ret = interval / SEC_PER_DAY;
  else
    ret = 0;
  return (ret);
}

@end

int	main(void)
{
  NSAutoreleasePool	*pool;
  NSDate		*today;
  NSDate		*date1;

  pool = [[NSAutoreleasePool alloc] init];
  today = [NSDate date];
  date1 = [NSDate dateWithTimeInterval: -7200 sinceDate: today]; 
  /* date1 = [NSDate dateWithTimeIntervalSince1970: 1200000000]; */
  NSLog(@"Today: %@", today);
  NSLog(@"date1: %@", date1);
  printf("Days elapsed: %lu\n", [date1 elapsedDays: today]);
  [pool drain];
  /* sleep(100); */
  return (SUCCESS);
}
