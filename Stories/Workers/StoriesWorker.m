#import "StoriesWorker.h"

@interface StoriesWorker ()
@end

@implementation StoriesWorker

#pragma mark - Business Logic

-(id) init:(id<StoriesProtocol>) stories {
    self = [super init];
    if (self) {
        self.stories = stories;
    }
    return self;
}

-(void) fetchStoriesWithCompletionBlock:(StoriesBlock)block {
    if (block) {
        @try
        {
            [self.stories fetchStoriesWithCompletionBlock:^(NSDictionary *responseDictionary, NSError *error) {
                if ((error == nil) && (responseDictionary)) {
                    id storyList = [self.stories storiesFromDictionary:responseDictionary];
                    block(storyList);
                }
            }];
        }
        @catch (NSException *exception)
        {
            block(@[]);
        }
    }
}

@end
