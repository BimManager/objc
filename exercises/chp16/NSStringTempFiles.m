/*
	NSStringTempFiles.m
	To extend NSString class via a category called TempFiles
*/

#import <Foundation/Foundation.h>

@interface NSString (TempFiles)

+ (NSString *)temporaryFileName;

@end

@implementation NSString (TempFiles)

+ (NSString *)temporaryFileName
{
  NSString	*tmpDir;
  NSString	*uniqStr;
  NSProcessInfo	*pi; 
  NSAutoreleasePool	*pool;

  pi = [[NSProcessInfo alloc] init];
  tmpDir =  NSTemporaryDirectory();
  uniqStr = [pi globallyUniqueString];
#ifdef DEBUG
  NSLog(@"tmpDir = %@; uniqStr = %@", tmpDir, uniqStr);
#endif
  [pi release];
  return ([tmpDir stringByAppendingString: uniqStr]);
}

@end

#ifdef DEBUG
int	main(void)
{
  NSAutoreleasePool	*pool;
  NSString		*tmp;

  pool = [[NSAutoreleasePool alloc] init];
  tmp = [NSString temporaryFileName];
  NSLog(@"tmp = %@", tmp);
  [pool release];
  sleep(60);
  return (0);
}
#endif
