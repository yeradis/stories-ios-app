#import <UIKit/UIKit.h>
#import "StoriesProtocol.h"
#import "StoriesAPI.h"

@protocol ListStoriesModelsProtocol
@property (strong, atomic) NSArray<__kindof Story *> *stories;
-(id) init:(NSArray<__kindof Story *>*) stories;
@end

@interface ListStoriesRequest: NSObject
@property (strong, atomic) id<StoriesProtocol> storiesClient;
-(id) init:(id<StoriesProtocol>) storiesClient;
@end

@interface ListStoriesResponse: NSObject<ListStoriesModelsProtocol>
@end

@interface ListStoriesViewModel: NSObject<ListStoriesModelsProtocol>
@end
