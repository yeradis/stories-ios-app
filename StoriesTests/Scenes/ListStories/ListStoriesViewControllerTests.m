#import <XCTest/XCTest.h>
#import "ListStoriesViewController.h"

@interface ListStoriesViewControllerTests : XCTestCase

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ListStoriesViewController* sut;

@end

@implementation ListStoriesViewControllerTests

- (void)setUp
{
  [super setUp];
  self.window = [[UIWindow alloc] init];
  [self setupListStoriesViewController];
}

- (void)tearDown
{
  self.window = nil;
  [super tearDown];
}

#pragma mark - Test setup

- (void)setupListStoriesViewController
{
  NSBundle *bundle = [NSBundle mainBundle];
  UIStoryboard *storyboard = [UIStoryboard storyboardWithName: @"Main" bundle: bundle];
  self.sut = (ListStoriesViewController *)[storyboard instantiateViewControllerWithIdentifier: @"ListStoriesViewController"];
}

- (void)loadView
{
  [self.window addSubview:self.sut.view];
  [[NSRunLoop currentRunLoop] runUntilDate:[NSDate date]];
}

#pragma mark - Tests

- (void)test_ViewLoad_ShouldNoThrow
{
    XCTAssertNoThrow(self.sut.view);
}

@end
