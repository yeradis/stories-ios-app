#import "ListStoriesModels.h"

@implementation ListStoriesRequest

-(id) init:(id<StoriesProtocol>) storiesClient {
    self = [super init];
    if (self) {
        self.storiesClient = storiesClient;
    }
    return self;
}

@end

@implementation ListStoriesResponse

@synthesize stories =_stories;

-(id) init:(NSArray<__kindof Story *> *)stories{
    self = [super init];
    if (self) {
        _stories = stories;
    }
    return self;
}

@end

@implementation ListStoriesViewModel

@synthesize stories = _stories;

-(id) init:(NSArray<__kindof Story *> *)stories{
    self = [super init];
    if (self) {
        _stories = stories;
    }
    return self;
}
@end
