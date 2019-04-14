/*
	copy.m
	To get the hang of
	NSFileManager, NSFileHandler, NSData and other classes
	for working with files and directories.
*/

#import <Foundation/Foundation.h>

#define BUFF_SIZE	1
#define EXIT_SUCCESS	0
#define EXIT_FAILURE	1

NSMutableArray	*processInput(int argc, char **argv);
NSString	*constructPath(const char *fileName, BOOL *isDir, BOOL *exists);
static int	copy(NSString *dstPath, NSString *srcPath);

int		main(int argc, char **argv)
{
  NSAutoreleasePool	*pool;
  NSMutableArray	*paths;
  NSUInteger		i;

  if (argc < 3)
    {
      NSLog(@"copy usage: file1 [file2] [...] file(directory)");
      return (EXIT_FAILURE);
    }
  pool = [[NSAutoreleasePool alloc] init];
  paths = processInput(argc, argv);
#ifdef DEBUG
  if (paths)
    NSLog(@"%@", paths);
#endif
  i = [paths count];
  while (i-- > 1)
    copy([paths objectAtIndex: 0], [paths objectAtIndex: i]);
  [paths release];
  [pool release];
  return (EXIT_SUCCESS);
}

NSString	*constructPath(const char *fileName, BOOL *isDir, BOOL *exists)
{
  NSFileManager	*fm;
  NSString	*path;

  fm = [NSFileManager defaultManager];
  if (*(fileName) == '/')
    path = [NSString stringWithUTF8String: fileName];
  else
    {
      path = [fm currentDirectoryPath];
      path = [path stringByAppendingPathComponent: [NSString stringWithUTF8String: fileName]];
    }
  *exists = [fm fileExistsAtPath: path isDirectory: isDir];
#ifdef DEBUG
  NSLog(@"path = %@; exists = %i; isDir = %i; refCount = %lu",
	path, *exists, *isDir, [path retainCount]);
#endif	
  return (path);
}

NSMutableArray	*processInput(int argc, char **argv)
{
  BOOL			isDir;
  BOOL			exists;
  NSString		*srcPath;
  NSString		*dstPath;
  NSMutableArray	*paths;

  paths = [[NSMutableArray alloc] init];
  if (argc > 3)
    {
      dstPath = constructPath(argv[argc - 1], &isDir, &exists);
      if (!isDir)
	{
	  NSLog(@"The destination is not a direcory.");
	  return (NULL);
	}
      [paths addObject: dstPath];
    }
  else
    {
      dstPath = constructPath(argv[argc - 1], &isDir, &exists);
      [paths addObject: dstPath];
    }
  while (--argc > 1)
    {
      srcPath = constructPath(argv[argc - 1], &isDir, &exists);
      if (isDir || !exists)
	{
	  NSLog(@"%@ does not exist or is a directory", srcPath);
	  return (NULL);
	}
      [paths addObject: srcPath];
    }
  return (paths);
}

static int	copy(NSString *dstPath, NSString *srcPath)
{
  NSFileManager		*fm;
  NSFileHandle		*fhRead;
  NSFileHandle		*fhWrite;
  NSData		*buffer;
  BOOL			isDir;
  BOOL			doesExist;

  fm = [NSFileManager defaultManager];
  doesExist = [fm fileExistsAtPath: dstPath isDirectory: &isDir];
  if (doesExist && !isDir)
    [fm removeItemAtPath: dstPath error: NULL];
  if (doesExist && isDir)
    dstPath = [dstPath stringByAppendingPathComponent: [srcPath lastPathComponent]];
#ifdef DEBUG
  NSLog(@"finalDstPath = %@; isDir: %i", dstPath, isDir);
#endif
  if (![fm createFileAtPath:	dstPath 
	   contents: 		NULL
	   attributes: 		NULL])
    return (3);
  fhRead = [NSFileHandle fileHandleForReadingAtPath: srcPath];
  fhWrite = [NSFileHandle fileHandleForWritingAtPath: dstPath];
  while ([(buffer = [fhRead readDataOfLength: BUFF_SIZE]) length])
    {
#ifdef DEBUG
      NSLog(@"buffer = %@", buffer);
#endif
      [fhWrite writeData: buffer];
    }
  [fhRead closeFile];
  [fhWrite closeFile];
  return (0);
}
