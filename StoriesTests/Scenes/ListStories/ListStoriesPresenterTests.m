#import <XCTest/XCTest.h>
#import "ListStoriesPresenter.h"

@interface ListStoriesPresenterTests : XCTestCase

@property (strong, nonatomic) ListStoriesPresenter* sut;

@end

@implementation ListStoriesPresenterTests

- (void)setUp
{
  [super setUp];
  [self setupListStoriesPresenter];
}

- (void)tearDown
{
  [super tearDown];
}

#pragma mark - Test setup

- (void)setupListStoriesPresenter
{
  self.sut = [[ListStoriesPresenter alloc] init];
}

#pragma mark - Tests

- (void)testExample
{
  // Given
  
  // When
  
  // Then
}

@end
