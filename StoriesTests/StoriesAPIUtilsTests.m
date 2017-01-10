#import <XCTest/XCTest.h>
#import "StoriesAPI.h"
#import <AFNetworking/AFNetworking.h>

@interface StoriesAPIUtilsTests : XCTestCase

@end

@implementation StoriesAPIUtilsTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void) test_storyFromDictionary_HavingNil_ShouldNoThrow {
    XCTAssertNoThrow([[[StoriesAPI alloc] init] storyFromDictionary:nil]);
}

- (void) test_storiesFromDictionary_ShouldReturnAMatch {
    
    NSArray* multimedia = @[@{kItemUrl:@"LAURL"}];
    NSDictionary* item = @{kItemAbstract:@"RESUMEN",
                           kItemByline:@"AUTOR",
                           kItemMultimedia:multimedia};
    
    Story* story = [[[StoriesAPI alloc] init] storyFromDictionary:item];
    BOOL match = [story.abstract isEqualToString:@"RESUMEN"]
    && [story.author isEqualToString:@"AUTOR"]
    && [story.coverURL isEqualToString:@"LAURL"];
    
    XCTAssertTrue(match);
}

@end
