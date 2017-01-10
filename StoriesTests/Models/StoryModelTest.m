#import <XCTest/XCTest.h>
#import "StoriesModel.h"

@interface StoryModelTest : XCTestCase

@end

@implementation StoryModelTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test_initWithDictionary_havingNilParam_ShouldNoThrow {
    XCTAssertNoThrow([[StoryModel alloc] initWithDictionary:nil]);
}

- (void)test_initWithDictionary_havinEmptyDictionary_ShouldNoThrow {
    XCTAssertNoThrow([[StoryModel alloc] initWithDictionary:@{}]);
}

- (void)test_initWithDictionary_havinValidDictionaryWithoutMultimediaItems_ShouldMatch {
    NSString* abstractValue = @"an abstract";
    NSString* authorValue = @"an author";
    NSString* typeValue = @"a story type";
    
    NSDictionary* dic = @{
                          @"abstract":abstractValue,
                          @"byline":authorValue,
                          @"item_type":typeValue
                          };
    
    StoryModel* model = [[StoryModel alloc] initWithDictionary:dic];
    BOOL match = [model.abstract isEqualToString:abstractValue]
    && [model.author isEqualToString:authorValue]
    && [model.type isEqualToString:typeValue]
    && model.multimedia == nil;
    
    XCTAssertTrue(match);
}

- (void)test_initWithDictionary_havinValidDictionaryANDMultimediaItems_ShouldMatch {
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
    
    NSDictionary* dic = @{
                          @"abstract":abstractValue,
                          @"byline":authorValue,
                          @"item_type":typeValue,
                          @"multimedia":@[multimediaDictionary]
                          };
    
    StoryModel* model = [[StoryModel alloc] initWithDictionary:dic];
    MultimediaModel* media = (MultimediaModel*)[model.multimedia firstObject];
    BOOL match = [model.abstract isEqualToString:abstractValue]
    && [model.author isEqualToString:authorValue]
    && [model.type isEqualToString:typeValue]
    && [media.url isEqualToString:urlValue]
    && [media.copyright isEqualToString:copyrightValue]
    && [media.format isEqualToString:formatValue]
    && [media.caption isEqualToString:captionValue];
    
    XCTAssertTrue(match);
}
@end
