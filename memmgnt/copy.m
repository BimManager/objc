/*
	copy.m
	mutableCopy and copy functions
*/

#import <Foundation/Foundation.h>

int	main(void)
{
  NSAutoreleasePool	*pool;
  NSMutableArray	*dataArray;
  NSMutableArray	*anotherArray;

  pool = [[NSAutoreleasePool alloc] init];
  dataArray = [NSMutableArray arrayWithObjects:
				@"one", @"two", @"three",
			      @"four", nil];
  NSLog(@"dataArray count: %lx", [dataArray retainCount]);
  anotherArray = [dataArray mutableCopy];
  [dataArray removeObjectAtIndex: 0];
  NSLog(@"dataArray count: %lx", [dataArray retainCount]);
  NSLog(@"dataArray:\n%@", dataArray);
  NSLog(@"anotherArray:\n%@", anotherArray);
  [pool release];
  [dataArray release];
  [anotherArray release];
  //  sleep(60);
  return (0);
}
