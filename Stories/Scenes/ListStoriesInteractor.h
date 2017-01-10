#import "ListStoriesCommon.h"

@interface ListStoriesInteractor: NSObject <ListStoriesInteractorInput, ListStoriesViewControllerOutput>
@property (strong, nonatomic) StoriesWorker *worker;
@property (strong, nonatomic) id<ListStoriesInteractorOutput> output;
- (void)fetchStories:(ListStoriesRequest *)request;
@end
