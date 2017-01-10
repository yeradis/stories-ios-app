#import "ListStoriesCommon.h"

@protocol ListStoriesPresenterInput
- (void)presentStories:(ListStoriesResponse *)response;
@end

@protocol ListStoriesPresenterOutput
- (void)displayStories:(ListStoriesViewModel *)viewModel;
@end
