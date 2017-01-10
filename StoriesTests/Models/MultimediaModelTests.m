#import <XCTest/XCTest.h>
#import "StoriesModel.h"

@interface MultimediaModelTests : XCTestCase

@end

@implementation MultimediaModelTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)test_initWithDictionary_havingNilParam_ShouldNoThrow {
    XCTAssertNoThrow([[MultimediaModel alloc] initWithDictionary:nil]);
}

- (void)test_initWithDictionary_havinEmptyDictionary_ShouldNoThrow {
    XCTAssertNoThrow([[MultimediaModel alloc] initWithDictionary:@{}]);
}

- (void)test_initWithDictionary_havinValidDictionary_ShouldMatch {
    NSString* captionValue = @"el caption";
    NSString* copyrightValue = @"el copy";
    NSString* formatValue = @"el formato";
    NSString* urlValue = @"la url";
    
    NSDictionary* dic = @{
                          @"caption":captionValue,
                          @"copyright":copyrightValue,
                          @"format":formatValue,
                          @"url":urlValue
                          };
    
    MultimediaModel* model = [[MultimediaModel alloc] initWithDictionary:dic];
    BOOL match = [model.caption isEqualToString:captionValue]
    && [model.copyright isEqualToString:copyrightValue]
    && [model.format isEqualToString:formatValue]
    && [model.url isEqualToString:urlValue];
    
    XCTAssertTrue(match);
}
@end
