#import "ListStoriesCommon.h"

@protocol ListStoriesInteractorInput
- (void)fetchStories:(ListStoriesRequest *)request;
@end

@protocol ListStoriesInteractorOutput
- (void)presentStories:(ListStoriesResponse *)response;
@end
