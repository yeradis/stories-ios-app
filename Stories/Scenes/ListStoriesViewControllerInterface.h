#import "ListStoriesCommon.h"

@protocol ListStoriesViewControllerInput
- (void)displayStories:(ListStoriesViewModel *)viewModel;
@end

@protocol ListStoriesViewControllerOutput
- (void)fetchStories:(ListStoriesRequest *)request;
@end
