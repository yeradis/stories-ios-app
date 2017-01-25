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
            [self.stories fetchStoriesWithCompletionBlock:^(NSArray<StoryModelProtocol> * stories, NSError *error) {
                if ((error == nil) && (stories)) {
                    block(stories);
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
