#import "StoriesModel.h"

NSString* const kItemByline         = @"byline";
NSString* const kItemType           = @"item_type";
NSString* const kItemAbstract       = @"abstract";
NSString* const kItemMultimedia     = @"multimedia";
NSString* const kItemUrl            = @"url";
NSString* const kItemResults        = @"results";
NSString* const kItemFormat         = @"format";
NSString* const kItemCaption        = @"caption";
NSString* const kItemCopyright      = @"copyright";


NSString* const kItemMediaTypeSuperJumbo = @"superJumbo";

@implementation StoriesModel

-(id) initWithDictionary:(NSDictionary *) dictionary {
    self = [super init];
    if (self) {
        [self parseDictionary:dictionary];
    }
    return self;
}

-(void) parseDictionary:(NSDictionary*) dic {
    
    if (dic == nil || [dic isKindOfClass:[NSDictionary class]] == NO || [dic count] == 0)
    {
        @throw [NSException exceptionWithName:@"Missing values" reason:@"Can not be nil or empty" userInfo:nil];
    }
    
    self.status = dic[@"status"];
    self.copyright = dic[@"copyright"];
    self.numResults = [dic[@"num_results"] integerValue];
    self.lastUpdated = dic[@"last_updated"];
    self.section = dic[@"section"];
    
    NSArray<StoryModel>* stories = [self parseStoriesDictionary:dic[@"results"]];
    self.stories = stories;
}

-(NSArray<StoryModel>*) parseStoriesDictionary:(NSDictionary*) dic {
    NSMutableArray<StoryModel> *stories = [[NSMutableArray<StoryModel> alloc] init];
    for (NSDictionary* storyDic in dic){
        StoryModel* story = [[StoryModel alloc] initWithDictionary:storyDic];
        [stories addObject:story];
    }
    return [stories copy];
}

@end

@implementation StoryModel
-(id) initWithDictionary:(NSDictionary *) dictionary {
    self = [super init];
    if (self) {
        [self parseDictionary:dictionary];
    }
    return self;
}
-(void) parseDictionary:(NSDictionary*) dic {
    self.author = dic[kItemByline];
    self.abstract = dic[kItemAbstract];
    self.type = dic[kItemType];

    if (dic[kItemMultimedia]){
        NSArray<MultimediaModel>* multimedia = [self parseMultimediaDictionary:dic[kItemMultimedia]];
        self.multimedia = multimedia;
        self.coverImageUrl = [self getCoverImageUrl];
    }
}

-(NSString*) getCoverImageUrl{
    for (MultimediaModel* media in self.multimedia) {
        if ([media.format isEqualToString:kItemMediaTypeSuperJumbo]) {
            return media.url;
        }
    }
    return [[self.multimedia firstObject] url];
}

-(NSArray<MultimediaModel>*) parseMultimediaDictionary:(NSDictionary*) mediaList {
    NSMutableArray<MultimediaModel> *multimedia = [[NSMutableArray<MultimediaModel> alloc] init];
    for (NSDictionary* media in mediaList){
        MultimediaModel* mediaModel = [[MultimediaModel alloc] initWithDictionary:media];
        [multimedia addObject:mediaModel];
    }
    return [multimedia copy];
}

@end

@implementation MultimediaModel
-(id) initWithDictionary:(NSDictionary *) dictionary {
    self = [super init];
    if (self) {
        [self parseDictionary:dictionary];
    }
    return self;
}
-(void) parseDictionary:(NSDictionary*) dic {
    self.caption = dic[kItemCaption];
    self.copyright = dic[kItemCopyright];
    self.format = dic[kItemFormat];
    self.url = dic[kItemUrl];
}
@end
