/*
	myfind.m
	Exercise no. 2
*/

#import <Foundation/Foundation.h>

#define SUCCESS	0
#define ERROR	1

static int	confirmInput(int argc, char **argv, NSString **dir, NSString **filename);
static NSString	*find(NSString *dir, NSString *filename);

int		main(int argc, char **argv)
{
  NSAutoreleasePool	*pool;
  NSString		*dir;
  NSString		*filename;
  NSString		*path;

  pool = [[NSAutoreleasePool alloc] init];
  if (confirmInput(argc, argv, &dir, &filename))
    return (ERROR);
#ifdef DEBUG
  NSLog(@"dir = %@; filename = %@", dir, filename);
#endif
  path = find(dir, filename);
  if (path)
    NSLog(@"%@", path);
  else
    NSLog(@"No such file.");
#ifdef DEBUG
  NSLog(@"dir count = %lx", [dir retainCount]);
  NSLog(@"filename count = %lx", [filename retainCount]);
#endif
  [dir release];
  [filename release];
  [pool release];
  return (SUCCESS);
}

static int	confirmInput(int argc, char **argv, NSString **dir, NSString **filename)
{
  NSFileManager	*fm;
  BOOL		isDir;

  if (argc != 3)
    {
      NSLog(@"myfind usage: myfind startingDir filename");
      return (ERROR);
    }
  fm = [[NSFileManager alloc] init];
  *dir = [[NSString alloc] initWithUTF8String: argv[1]];
  *filename = [[NSString alloc] initWithUTF8String: argv[2]];
  if (![fm fileExistsAtPath: *dir isDirectory: &isDir])
    {
      [fm release];
      NSLog(@"The directory does not exist.");
      return (ERROR);
    } 
  if (!isDir)
    {
      [fm release];
      NSLog(@"This is not a directory.");
      return (ERROR);
    }
  [fm release];
  return (SUCCESS);
}

static NSString	*find(NSString *dir, NSString *filename)
{
  NSFileManager		*fm;
  NSArray		*contentsOfDir;
  NSMutableArray	*dirsToExplore;
  BOOL			isDir;
  NSString		*path;

  fm = [[NSFileManager alloc] init];
  dirsToExplore = [[NSMutableArray alloc] init];
  contentsOfDir = [fm contentsOfDirectoryAtPath: dir error: NULL];
#ifdef DEBUG
  NSLog(@"Contents of %@:\n%@", dir,  contentsOfDir);
#endif
  if (![contentsOfDir count])
    return (NULL);
  for (NSString *content in contentsOfDir)
    {
      path = [dir stringByAppendingPathComponent: content];
#ifdef DEBUG
      NSLog(@"path = %@", path);
#endif
      [fm fileExistsAtPath: path isDirectory: &isDir];
      if (isDir)
	{
	  [dirsToExplore addObject: path];
#ifdef DEBUG
      NSLog(@"Directories:\n%@", dirsToExplore);
#endif
	  continue;
	}
      if ([filename compare: content] == NSOrderedSame)
	return (path); 
    }
  if ([dirsToExplore count])
    for (NSString *d in dirsToExplore)
      {
#ifdef DEBUG
	NSLog(@"d = %@", d);
#endif
	path = (find(d, filename));
      if (path)
	{
	  [dirsToExplore release];
	  [fm release];
	  return (path);
	}
      }
  [dirsToExplore release];
  [fm release];
  return (NULL);
}
