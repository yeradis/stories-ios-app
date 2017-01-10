#import <XCTest/XCTest.h>
#import "StoriesAPI.h"

@interface StoriesAPIIntegrationTests : XCTestCase

@end

@implementation StoriesAPIIntegrationTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)test_fetchStoriesWithUrl_HavingNilParams_ShouldNoThrow {
    StoriesAPI* api = [[StoriesAPI alloc] init];
    XCTAssertNoThrow([api fetchStoriesWithUrl:nil params:nil completionBlock:nil]);
}

- (void)test_integration_fetchStoriesWithCompletionBlock_ShouldReturnSomething {
    XCTestExpectation *expectation1 = [self expectationWithDescription:@"expectation"];
    
    StoriesAPI* api = [[StoriesAPI alloc] init];
    [api fetchStoriesWithCompletionBlock:^(NSDictionary *responseDictionary, NSError *error) {
        [expectation1 fulfill];
        XCTAssertNotNil(responseDictionary);
    }];
    
    [self waitForExpectationsWithTimeout:15 handler:nil];
}

- (void)test_integration_fetchStoriesWithCompletionBlock_ShouldReturnSomeResults {
    XCTestExpectation *expectation1 = [self expectationWithDescription:@"expectation"];
    
    StoriesAPI* api = [[StoriesAPI alloc] init];
    [api fetchStoriesWithCompletionBlock:^(NSDictionary *responseDictionary, NSError *error) {
        [expectation1 fulfill];
        XCTAssertNotNil(responseDictionary);
        XCTAssertGreaterThan([responseDictionary[@"num_results"] integerValue], 0);
    }];
    
    [self waitForExpectationsWithTimeout:15 handler:nil];
}

@end
