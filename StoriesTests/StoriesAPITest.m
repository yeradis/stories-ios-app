#import <XCTest/XCTest.h>
#import "StoriesAPI.h"
#import <OCMock/OCMock.h>

@interface StoriesAPITest : XCTestCase
@property id partiallyMockedApi;
@end

@implementation StoriesAPITest

- (void)setUp {
    [super setUp];
    StoriesAPI* api = [[StoriesAPI alloc] init];
    
    self.partiallyMockedApi = [OCMockObject partialMockForObject:api];
    [[self.partiallyMockedApi expect] fetchStoriesDictionaryWithUrl:OCMOCK_ANY params:OCMOCK_ANY completionBlock:[OCMArg invokeBlockWithArgs:[self mockStoriesDictionary],OCMOCK_ANY, nil]];
}

- (void)tearDown {

    [super tearDown];
}

-(NSDictionary*) mockStoriesDictionary {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *path = [bundle pathForResource:@"stories" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    NSError* error;
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data
                                                         options:kNilOptions
                                                           error:&error];
    return json;
}

- (void)test_fetchStoriesDictionaryWithCompletionBlock_ShouldReturnSomething {
    XCTestExpectation *expectation1 = [self expectationWithDescription:@"expectation"];

    [self.partiallyMockedApi fetchStoriesDictionaryWithCompletionBlock:^(NSDictionary *responseDictionary, NSError *error) {
        [expectation1 fulfill];
        XCTAssertNotNil(responseDictionary);
    }];
    
    [self waitForExpectationsWithTimeout:15 handler:nil];
}

- (void)test_fetchStoriesDictionaryWithCompletionBlock_ShouldReturnSomeResults {
    XCTestExpectation *expectation1 = [self expectationWithDescription:@"expectation"];
    
    [self.partiallyMockedApi fetchStoriesDictionaryWithCompletionBlock:^(NSDictionary *responseDictionary, NSError *error) {
        [expectation1 fulfill];
        XCTAssertNotNil(responseDictionary);
        XCTAssertGreaterThan([responseDictionary[@"num_results"] integerValue], 0);
    }];
    
    [self waitForExpectationsWithTimeout:15 handler:nil];
}

- (void)test_fetchStoriesWithCompletionBlock_ShouldReturnSomeResults {
    XCTestExpectation *expectation1 = [self expectationWithDescription:@"expectation"];

    [self.partiallyMockedApi fetchStoriesWithCompletionBlock:^(NSArray<StoryModelProtocol> *stories, NSError *error) {
        [expectation1 fulfill];
        XCTAssertNotNil(stories);
        XCTAssertGreaterThan(stories.count, 0);
    }];
    
    [self waitForExpectationsWithTimeout:15 handler:nil];
}

@end
