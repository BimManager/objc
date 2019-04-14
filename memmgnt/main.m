/*
	main.m
	Memory management
*/

#import <Foundation/Foundation.h>

#define SUCCESS	1
#define ERROR	2

@interface KKZPhone: NSObject
{
  NSString	*model;
  NSUInteger	number;
}

@property (nonatomic, copy) NSString *model;
@property (nonatomic) NSUInteger number;

- (id)init;
- (void)dealloc;
- (NSString *)description;
- (id)initWithModel:(NSString *)theModel number:(NSUInteger) theNumber;

@end

@implementation KKZPhone

@synthesize model;
@synthesize number;

- (id)init
{
  return ([self initWithModel: @"Nokia" number:123456789]);
}

- (id)initWithModel:(NSString *)theModel number:(NSUInteger) theNumber;
{
  if (self = [super init])
    {
      model = [[NSString alloc] initWithString: theModel];
      number = theNumber;
    }
  return (self);
}

- (void)dealloc
{
  [model release];
  [super dealloc];
}

- (NSString *)description
{
  NSString *des;

  des = [[NSString alloc] initWithFormat:@"\nModel: %@\nNumber: %lu\nRetain Count: %lu\n",
			  model, number, [self retainCount]];
  return ([des autorelease]);
}

@end

int	main(void)
{
  NSAutoreleasePool	*pool;
  KKZPhone		*ph1;

  pool = [[NSAutoreleasePool alloc] init];
  ph1 = [[KKZPhone alloc] init];
  NSLog(@"%@", ph1);
  [ph1 retain];
  NSLog(@"%@", ph1);
  [ph1 release];
  NSLog(@"%@", ph1);
  [ph1 release];
  //  NSLog(@"%@", ph1);
  [pool release];
  return (SUCCESS);
}
