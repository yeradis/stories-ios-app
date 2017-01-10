#import "ListStoriesInteractor.h"
#import "StoriesWorker.h"
#import "StoriesAPI.h"

@interface ListStoriesInteractor ()
@end

@implementation ListStoriesInteractor

#pragma mark - Business logic

- (void)fetchStories:(ListStoriesRequest *)request
{
  // NOTE: Create some Worker to do the work
  if (self.worker == nil) {
        self.worker = [[StoriesWorker alloc] init];
  }
    
  self.worker.stories = request.storiesClient;
  [self.worker fetchStoriesWithCompletionBlock:^(NSArray<__kindof Story *> *storyList) {
      if (storyList) {
          // NOTE: Pass the result to the Presenter
          [self presentStories:storyList];
      }
  }];
}

-(void) presentStories:(NSArray<__kindof Story *>*) storyList {
    ListStoriesResponse *response = [[ListStoriesResponse alloc] init:storyList];
    [self.output presentStories:response];
}

@end
