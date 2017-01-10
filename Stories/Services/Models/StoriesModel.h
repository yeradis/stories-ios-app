#import <Foundation/Foundation.h>

extern NSString* const kItemByline;
extern NSString* const kItemAbstract;
extern NSString* const kItemMultimedia;
extern NSString* const kItemUrl;
extern NSString* const kItemResults;
extern NSString* const kItemCaption;
extern NSString* const kItemFormat;
extern NSString* const kItemCopyright;

@protocol StoriesModel;
@protocol StoryModel;
@protocol MultimediaModel;

@interface StoriesModel : NSObject
@property (strong, nonatomic) NSString* status;
@property (strong, nonatomic) NSString* copyright;
@property (strong, nonatomic) NSString* section;
@property (strong, nonatomic) NSDate* lastUpdated;
@property (nonatomic) NSInteger numResults;
@property (strong, nonatomic) NSArray<StoryModel>* stories;

-(id) initWithDictionary:(NSDictionary*) dictionary;

@end

@interface MultimediaModel : NSObject
@property (nonatomic) NSString* caption;
@property (nonatomic) NSString* copyright;
@property (nonatomic) NSString* format;
@property (nonatomic) NSString* url;

-(id) initWithDictionary:(NSDictionary*) dictionary;
@end

@interface StoryModel : NSObject
@property (nonatomic) NSString* abstract;
@property (nonatomic) NSString* author;
@property (nonatomic) NSString* type;
@property (nonatomic) NSString* coverImageUrl;
@property (nonatomic) NSArray<MultimediaModel>* multimedia;

-(id) initWithDictionary:(NSDictionary *) dictionary;
@end

