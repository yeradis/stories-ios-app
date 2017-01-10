#import <XCTest/XCTest.h>
#import "StoriesModel.h"

@interface StoriesModelTests : XCTestCase

@end

@implementation StoriesModelTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)test_initWithDictionary_havingNilParam_ShouldThrowException {
    XCTAssertThrows([[StoriesModel alloc] initWithDictionary:nil]);
}

-(void)test_initWithDictionary_havingEmptyDictionary_ShouldThrowException {
    XCTAssertThrows([[StoriesModel alloc] initWithDictionary:@{}]);
}

-(void)test_initWithDictionary_havingValidDictionary_ShouldReturnShomething {
    //multimedia item
    NSString* captionValue = @"media caption";
    NSString* copyrightValue = @"media copyright";
    NSString* formatValue = @"media format value, we want the jumbo size";
    NSString* urlValue = @"media url, please best quality at the smallest size";
    
    NSDictionary* multimediaDictionary = @{
                                           @"caption":captionValue,
                                           @"copyright":copyrightValue,
                                           @"format":formatValue,
                                           @"url":urlValue
                                           };
    
    //stoty item
    NSString* abstractValue = @"an abstract";
    NSString* authorValue = @"an author";
    NSString* typeValue = @"a story type";
    
    NSDictionary* storyDictionary = @{
                          @"abstract":abstractValue,
                          @"byline":authorValue,
                          @"item_type":typeValue,
                          @"multimedia":@[multimediaDictionary]
                          };
    
    NSDictionary* stories = @{
                              @"status":@"OK",
                              @"copyright":@"NYTimes stories, all rights reserved",
                              @"num_results":@"1",
                              @"last_updated":[NSDate new],
                              @"section":@"home",
                              @"results":@[storyDictionary]
                              };
    
    StoriesModel* model = [[StoriesModel alloc] initWithDictionary:stories];
    XCTAssertNotNil(model);
    XCTAssertNotNil(model.stories);
}

@end
