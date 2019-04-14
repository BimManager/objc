/*
	info.m
	To get a handle on working
	with the NSProcessInfo class
*/

#import <Foundation/Foundation.h>

#define EXIT_SUCCESS 0
#define UNKNOWN_ERROR 1

int	main(void)
{
  NSAutoreleasePool	*pool;
  NSEnumerator		*it;
  NSProcessInfo		*pi;
  NSArray		*args;
  NSDictionary		*envVariables;
  id			obj;


  pool = [[NSAutoreleasePool alloc] init];
  pi = [NSProcessInfo processInfo];
  args = [pi arguments];
  it = [args objectEnumerator];
  while ((obj = [it nextObject]))
    NSLog(@"%@", obj);
  envVariables = [pi environment];
  void (^printDic) (NSDictionary *) = 
    ^(NSDictionary *dic) 
    {
      NSArray		*keys;
      NSEnumerator	*itr;
      id		obj;

      keys = [dic allKeys];
      itr = [keys objectEnumerator];
      while ((obj = [itr nextObject]))
	NSLog(@"%@=%@", obj, [dic valueForKey: obj]);
    };
  printDic(envVariables);
  [pool release];
  return (EXIT_SUCCESS);
}
