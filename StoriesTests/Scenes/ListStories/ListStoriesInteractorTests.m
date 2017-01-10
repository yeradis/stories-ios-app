#import <XCTest/XCTest.h>
#import "ListStoriesInteractor.h"

#import "StoriesWorkersSpy.h"
#import "ListStoriesInteractorSpy.h"

@interface ListStoriesInteractorTests : XCTestCase

@property (strong, nonatomic) ListStoriesInteractor* sut;

@end

@implementation ListStoriesInteractorTests

- (void)setUp
{
  [super setUp];
  [self setupListStoriesInteractor];
}

- (void)tearDown
{
  [super tearDown];
}

#pragma mark - Test setup

- (void)setupListStoriesInteractor
{
  self.sut = [[ListStoriesInteractor alloc] init];
}

#pragma mark - Tests

- (void)testExample
{
  // Given
    ListStoriesInteractorOutputSpy *outputSpy = [[ListStoriesInteractorOutputSpy alloc] init];
    self.sut.output = outputSpy;
    StoriesWorkersSpy* workerSpy = [[StoriesWorkersSpy alloc] init];
    self.sut.worker = workerSpy;
  // When
    ListStoriesRequest *request = [[ListStoriesRequest alloc] init];
    [self.sut fetchStories:request];
  // Then
    XCTAssertTrue(workerSpy.fetchStoriesCalled);
    XCTAssertTrue(outputSpy.presentStoriesCalled);
}

@end
