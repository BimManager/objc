/*
	Working with files and directories
	main.m
*/

#import <Foundation/Foundation.h>

#define SUCCESS		0
#define NO_FILE		1
#define NO_DATA		2
#define COPY_FAILED	3
#define CREATION_FAILED	4
#define MOV_FAILED	5
#define CHG_FAILED	6

int	basicFileOperations(char *pathname);
int	basicDirOperations(void);
int	enumDirContents(void);
int	paths(void);

int	main(int argc, char **argv)
{
  NSAutoreleasePool	*pool;
  int			res;
  int			(*pfn)(void);

  pfn = &paths;
  res = SUCCESS;
  pool = [[NSAutoreleasePool alloc] init];
  if (argc == 2)
    res = basicFileOperations(argv[1]);
  //res = basicDirOperations();
  //  res = enumDirContents();
  res = pfn();
  NSLog(@"res = %i", res);
  [pool drain];
  return (res);
}

int	basicFileOperations(char *pathname)
{
  NSFileManager	*fm;
  NSDictionary	*attr;
  NSData	*buf;

  fm = [NSFileManager defaultManager];
  NSLog(@"fm.RetainCount = %lu", [fm retainCount]);

  if (![fm fileExistsAtPath: [NSString stringWithUTF8String: pathname]])
    return (NO_FILE);
  if (!(buf = [fm contentsAtPath: [NSString stringWithUTF8String: pathname]]))
    return (NO_DATA);
  NSLog(@"Content:\n%@", buf);
  if (!([fm copyItemAtPath: [NSString stringWithUTF8String: pathname]
	    toPath: @"baz"
	    error: NULL]))
      return (COPY_FAILED);
  if (!([fm createFileAtPath: @"bar" contents: buf attributes: NULL]))
    return (CREATION_FAILED);
  return (SUCCESS);
}
  
int	basicDirOperations()
{
  NSString	*dirName;
  NSString	*path;
  NSFileManager	*fm;

    fm = [NSFileManager defaultManager];
  dirName = @"testdir";
  path = [fm currentDirectoryPath];
  NSLog(@"Current directory: %@", path);
  if (![fm createDirectoryAtPath: dirName
	   withIntermediateDirectories: YES
	   attributes: NULL
	   error: NULL])
    return (CREATION_FAILED);
  if (![fm moveItemAtPath: dirName
	   toPath: @"newdir"
	   error: NULL])
    return (MOV_FAILED);
  if (![fm changeCurrentDirectoryPath: @"newdir"])
    return (CHG_FAILED);
  path = [fm currentDirectoryPath];
  NSLog(@"Current directory: %@", path);
  NSLog(@"Luckily, everything has gone smoothly.");
  return (SUCCESS);
}

int	enumDirContents()
{
  NSFileManager		*fm;
  NSString		*curDir;
  NSDirectoryEnumerator	*dirEnum;
  NSArray		*dirArr;
  
  fm = [NSFileManager defaultManager];
  curDir = [fm currentDirectoryPath];
  dirEnum = [fm enumeratorAtPath: curDir];
  while (curDir = [dirEnum nextObject])
    NSLog(@"%@", curDir);
  dirArr = [fm contentsOfDirectoryAtPath: [fm currentDirectoryPath] error: NULL];
  NSLog(@"\n");
  for (curDir in dirArr)
    NSLog(@"%@", curDir);
  return (SUCCESS);
}

int	paths()
{
  NSString	*fName;
  NSFileManager	*fm;
  NSString	*path;
  NSString	*fullPath;
  NSArray	*components;
  NSString	*upath;

  upath = @"~/programming/";
  fName = @"a.out";
  fm = [NSFileManager defaultManager];
  path = NSTemporaryDirectory();
  NSLog(@"Temporary Directory is %@", path);
  path = [fm currentDirectoryPath];
  NSLog(@"Current Directory is %@", path);
  NSLog(@"Last Path Component is %@", [path lastPathComponent]);
  fullPath = [path stringByAppendingPathComponent: fName];
  NSLog(@"Full Path is %@", fullPath);
  path = [fullPath pathExtension];
  NSLog(@"Extension for %@ is %@", fullPath, path);
  path = NSHomeDirectory();
  NSLog(@"Home Directory: %@", path);
  components = [fullPath pathComponents];
  for (path in components)
    NSLog(@"%@", path);
  NSLog(@"%@ => %@", upath, [upath stringByStandardizingPath]);
  path = NSUserName();
  NSLog(@"User Name: %@", path);
  NSLog(@"Full User Name: %@", NSFullUserName());
  NSLog(@"Home Directory: %@", NSHomeDirectory());
  NSLog(@"Home Directory for User: kkozlov : %@", NSHomeDirectoryForUser(@"kkozlov"));
  NSLog(@"Caches Directory: %lu", NSCachesDirectory);
  NSLog(@"All Done! Cheers!");
  return (SUCCESS);
}
