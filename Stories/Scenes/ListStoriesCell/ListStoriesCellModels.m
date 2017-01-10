#import "ListStoriesCellModels.h"

@implementation ListStoriesCellRequest
-(id) init:(id<StoryModelProtocol>) story {
    self = [super init];
    if (self) {
        self.story = story;
    }
    return self;
}
@end

@implementation ListStoriesCellResponse
@end

@implementation ListStoriesCellViewModel
@synthesize author,abstract,coverURL;
@end
