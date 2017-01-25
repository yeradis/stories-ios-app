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

- (void)test_fetchStoriesDictionaryWithUrl_HavingNilParams_ShouldNoThrow {
    StoriesAPI* api = [[StoriesAPI alloc] init];
    XCTAssertNoThrow([api fetchStoriesDictionaryWithUrl:nil params:nil completionBlock:nil]);
}

- (void)test_integration_fetchStoriesDictionaryWithCompletionBlock_ShouldReturnSomething {
    XCTestExpectation *expectation1 = [self expectationWithDescription:@"expectation"];
    
    StoriesAPI* api = [[StoriesAPI alloc] init];
    [api fetchStoriesDictionaryWithCompletionBlock:^(NSDictionary *responseDictionary, NSError *error) {
        [expectation1 fulfill];
        XCTAssertNotNil(responseDictionary);
    }];
    
    [self waitForExpectationsWithTimeout:15 handler:nil];
}

- (void)test_integration_fetchStoriesDictionaryWithCompletionBlock_ShouldReturnSomeResults {
    XCTestExpectation *expectation1 = [self expectationWithDescription:@"expectation"];
    
    StoriesAPI* api = [[StoriesAPI alloc] init];
    [api fetchStoriesDictionaryWithCompletionBlock:^(NSDictionary *responseDictionary, NSError *error) {
        [expectation1 fulfill];
        XCTAssertNotNil(responseDictionary);
        XCTAssertGreaterThan([responseDictionary[@"num_results"] integerValue], 0);
    }];
    
    [self waitForExpectationsWithTimeout:15 handler:nil];
}

@end
