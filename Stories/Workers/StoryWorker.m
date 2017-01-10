#import "StoryWorker.h"

@interface StoryWorker ()
@end

@implementation StoryWorker

#pragma mark - Business Logic

-(id) init:(id<StoryProtocol>)storyClient story:(id<StoryModelProtocol>) story{
    self = [super init];
    if (self) {
        self.story = story;
        self.storyClient = storyClient;
    }
    return self;
}

-(void) fetchStoryCoverImageWithCompletionBlock:(StoryCoverImageBlock)block {
    if (block) {
        @try
        {
            [self.storyClient fetchCoverImageForStory:self.story completionBlock:^(UIImage *responseImage, NSError *error) {
                if (error) {
                    block(nil);
                    return;
                };
                if (responseImage) block(responseImage);
            }];
        }
        @catch (NSException *exception)
        {
            block(nil);
        }
    }
}

@end
