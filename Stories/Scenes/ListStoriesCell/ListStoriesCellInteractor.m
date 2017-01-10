#import "ListStoriesCellInteractor.h"
#import "StoryWorker.h"
#import "StoryAPI.h"

@interface ListStoriesCellInteractor ()
@property (strong, nonatomic) StoryWorker *worker;
@end

@implementation ListStoriesCellInteractor

#pragma mark - Business logic

- (void)processStory:(ListStoriesCellRequest *)request
{
    //Lets show something and then call the worker
    ListStoriesCellResponse *response = [[ListStoriesCellResponse alloc] init];
    response.story = request.story;
    [self.output presentStory:response];
    
    // NOTE: Create some Worker to do the work
    StoryAPI* storyClient = [[StoryAPI alloc] init];
    self.worker = [[StoryWorker alloc] init:storyClient story:request.story];
    
    [self.worker fetchStoryCoverImageWithCompletionBlock:^(UIImage *cover) {
        if (cover){
            // NOTE: Pass the result to the Presenter
            ListStoriesCellResponse *response = [[ListStoriesCellResponse alloc] init];
            response.story = request.story;
            response.coverImage = cover;
            
            [self.output presentStory:response];
        }
    }];
}

@end
